import { mkdir, writeFile } from "node:fs/promises";
import { homedir } from "node:os";
import path from "node:path";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function systemPromptExtension(pi: ExtensionAPI) {
	pi.registerCommand("system-prompt", {
		description:
			"Write the current system prompt to a file. Usage: /system-prompt [output-path]",
		handler: async (args, ctx) => {
			const prompt = ctx.getSystemPrompt();
			const rawPath = args.trim();
			const outputPath = rawPath
				? path.resolve(ctx.cwd, rawPath)
				: path.join(homedir(), ".pi", "agent", "system-prompt.latest.md");

			await mkdir(path.dirname(outputPath), { recursive: true });
			await writeFile(outputPath, prompt, "utf8");

			ctx.ui.notify(`System prompt written to ${outputPath} (${prompt.length} chars)`, "info");
		},
	});
}
