<p align="center">
  
  <a href="https://discord.com/invite/5RmY6J2N7s">
    <img src="https://img.shields.io/badge/Discord-Join%20Us-5865F2?logo=discord&logoColor=white" />
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-green.svg" />
  </a>
</p>

<div align="center">

# SHOTGUN — Alpha

<br>

**Codebase-aware spec engine for Cursor, Claude Code & Lovable** 

<br>

  <p><em>Spec → Code:</em> decision-ready artifacts that capture your intents and values.</p>

<br>

  <p>
    <small>Repo-aware • Multi-agent • Local-first • Shareable on demand</small>
  </p>

<br>

```bash
sh -c "$(curl -fsSL https://install.shotgun.sh/install.sh)"
```

<img width="600" height="200" alt="Screenshot 2025-08-25 at 4 40 37 PM" src="https://github.com/user-attachments/assets/e9d15ea2-347e-4639-9e62-5d6a4edb47df" />

<br>

Your AI posse for researching, planning & building software. Repo-aware, multi-agent, and local-first — Shotgun creates decision-ready specs and shareable artifacts that truly capture your intents and context, so AI tools finally build what you mean.  


</div>

---
<nav id="toc" aria-label="Table of contents" style="margin:24px 0;">
  <h2 style="margin:0 0 12px 0;">Table of contents</h2>
  <ol style="line-height:1.9; margin:0; padding-left:20px;">
    <li><a href="#quickstart">Quickstart</a></li>
    <li><a href="#demo">Demo</a></li>
	<li><a href="#codebase-understanding">Codebase Understanding</a></li>
    <li><a href="#prompts">Try these prompts</a></li>
    <li><a href="#why">Why Shotgun</a></li>
    <li><a href="#capabilities">Key capabilities</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#faq">FAQ</a></li>
    <li><a href="#contributing">Contributing</a></li>
  </ol>
</nav>

---

<h2 id="quickstart">Quickstart</h2>


Install:

```bash
sh -c "$(curl -fsSL https://install.shotgun.sh/install.sh)"
```

Run:

```bash
shotgun
```
Prerequisites:
```bash
- macOS or Linux
- Python 3.11+
- Node.js 18+ (for CLI)
- git
```

Uninstall:

```bash
npm uninstall -g @proofs-io/shotgun @proofs-io/shotgun-server
```

---
<h2 id="demo">Demo</h2>

**Spec → Code:** Shotgun performs multi-agent research and produces specs. You export files formatted for your coding agents and keep everything local until you choose to share.


<p align="center">
  <a href="https://youtu.be/ex95q0uVkDk">
    <img src="https://github.com/user-attachments/assets/ed7fe107-f60d-4f8f-aada-ab21b6008fbb" alt="Watch the Shotgun demo" width="720">
  </a>
</p>

**Give Shotgun a spin**
```bash
I want to build an AI-powered ‘Tinder for Side Hustles.’ Right now it’s just a vague idea. 
Walk me step by step into shaping it into a concrete business plan
```
➡️ [View artifact](https://artifacts.shotgun.sh/657147be-52a1-48d6-8028-90b3a59adbbd/42dc89af-473e-44d7-b628-2dac55161b53/index.md)

---

<h2 id="codebase-understanding">Codebase Understanding 🚀</h2>

Shotgun can now index and understand your entire codebase (in Python, Typescript and Javascript).
This unlocks research, specs, and planning directly in the context of your repo.

<h3>Command</h3>

```bash 
/codebase add [path to your codebase]
```
<p align="center">
  <a href="https://youtu.be/cy1A6Kwt8J8">
    <img src="https://github.com/user-attachments/assets/02ade71b-cc5f-4d80-838d-a71c2cbc6234" alt="Watch the Shotgun demo" width="720">
  </a>
</p>

<h3>Prompt to Try</h3>

```bash 
Identify key modules, classes and the flows in the codebase. Document them in detail along with diagrams and code samples.
```

--- 

<h2 id="prompts">Try these prompts</h2>

<h4>📱 Indie builders — Local-first CRDT wiki</h4>
<pre><code>Design a local-first, end-to-end encrypted notes/wiki app (“Everfree”).
Compare CRDT options (Yjs vs Automerge vs Replicache) and sync transports (WebRTC mesh vs WebSocket relay vs Supabase).</code></pre>
<p>➡️ <a href="https://artifacts.shotgun.sh/7b666575-1e71-45cf-8697-1fbeddb328b5/a85a6157-5e58-4459-989a-21dbdb962359/index.md"><strong>View artifact</strong></a></p>

<h4>⚙️ Scaling teams — Standardize local dev</h4>
<pre><code>I want to start a new web project (frontend + backend). Evaluate JavaScript runtimes: 
Node.js, Bun, Deno, Cloudflare, and more. 

Compare: ESM/CJS/TS & npm/pnpm/bun compat, performance (cold starts/throughput), security/permissions 
(FS, network), Web vs Node APIs, native add-ons/FFI, tooling/testing/debugging, deployment targets 
(server, serverless, edge), containerization, observability, and cost.</code></pre>

<h4>🏦 Enterprise — PII-safe AI assistant</h4>
<pre><code>Design an on-prem or VPC-isolated, PII-safe AI knowledge assistant for a bank.
Compare retrieval stacks (Postgres+pgvector vs OpenSearch kNN vs Milvus, including hybrid BM25+vector, security, ops burden) and model options (self-hosted LLM vs no-retention hosted endpoint).

Deliver:
	1.	Compliance & access: Data residency, fine-grained RBAC/SSO (SAML/OIDC), document-level ACLs, tamper-evident audit logs.
	2.	Security architecture: DLP/redaction (ingest/query/output), anonymization, egress controls, guardrails for prompt-injection/data-exfil, STRIDE (+privacy) threat model.
	3.	Evaluation plan: Golden set, hallucination/adversarial tests, privacy-leak checks, acceptance gates (accuracy %, coverage %, latency SLOs, zero-PII-leak).
	4.	Vendor & ops: Encryption (at rest/in-transit, KMS/HSM), HA/DR strategy, observability, SIEM/SOAR hooks, patch/upgrade policy.</code></pre>

<hr>

<h2 id="why">Why Shotgun</h2>
<ul>
  <li>AI agents generate code fast, but it often doesn’t compile, misses intent, or picks odd architectures.</li>
  <li>The problem isn’t coding ability — it’s unclear specs.</li>
</ul>
<p><strong>Shotgun fixes that</strong> by producing decision-ready, repo-aware specs your agents can follow.</p>


---
<h2 id="capabilities">Key capabilities</h2>
<ul>
  <li><strong>Idea → Spec</strong>: PRDs, trade-offs, architectures, roadmaps.</li>
  <li><strong>Codebase-aware</strong>: reads your repo so outputs fit your system.</li>
  <li><strong>Spec → Code</strong>: export files formatted for Cursor, Claude Code, or Lovable (ready to drop into your workflow).</li>
  <li><strong>Multi-agent orchestration</strong>: Researcher, PM, Architect, Spec Writer.</li>
  <li><strong>Local-first</strong>: your keys, your data, your machine.</li>
  <li><strong>Artifacts Webview</strong>: preview locally; share links only when you choose.</li>
</ul>


---
<h2 id="roadmap">Roadmap</h2>

<h4>✅ Recently shipped</h4>
<ul>
  <li>Repo-aware spec generation</li>
  <li>Multi-agent orchestration</li>
  <li>Artifacts Webview (on-demand sharing)</li>
  <li>Export formats for Cursor / Claude / Lovable / Markdown</li>
</ul>


### 🚧 Coming soon
- [ ] Token usage display & spend tracking
- [ ] Support for local LLMs
- [ ] Implement sample prompts  
- [ ] Linear agents integration  
- [ ] Export to Cursor / Claude / Lovable (share in webview)  
- [ ] Task planning feature  
- [ ] Attachments: add screenshots / PDFs / files to Shotgun  
- [ ] Performance improvements (make Shotgun faster)  
- [ ] Authentication improvements (Anthropic Claude Max auth)  

---
## FAQ

**Q: Does Shotgun collect any stats or data?**  
A: We only gather minimal, anonymous events (e.g., install, server start, tool call). We don’t collect the content itself—only that an event occurred. We use Sentry for error reporting to improve stability.

**Q: Will it be open source?**  
A: Yes—open source release is planned during the alpha phase, with public issues and PRs.

**Q: Local LLMs?**  
A: Planned. We’ll publish compatibility notes and local provider integrations.

**Q: Does Shotgun send data to any server? Can I configure it with my own URL for the LLM?** 

A: We only gather minimal, anonymous events (e.g., install, server start, tool call). We don't collect the content itself—only that an event occurred. We use Sentry for error reporting to improve stability.

---
<h2 id="contributing">Contributing</h2>
<p>Shotgun is in Alpha — we’d love your feedback and support.</p>
<ul>
  <li>Join our <a href="https://discord.com/invite/5RmY6J2N7s"><strong>Discord</strong></a></li>
  <li>Open issues / discussions</li>
  <li>PRs welcome once core is open-sourced</li>
</ul>

<p><em>🚀 This week only:</em> We’re live on 
<a href="https://www.producthunt.com/posts/shotgun"><strong>Product Hunt</strong></a>.  
An upvote or comment there helps us reach more builders and gather early feedback.</p>

---

<div align="center">

  <h2>🚀 Ready to fix the vibe in vibe-coding?</h2>

  <p><strong>Turn open questions into repo-aware specs → feed them to Cursor, Claude, or Lovable → get code that actually matches your intent.</strong></p>

  <pre><code>sh -c "$(curl -fsSL https://install.shotgun.sh/install.sh)"</code></pre>

  <p>⚡ Takes 45 seconds to install.<br>
  🤠 Join the posse on <a href="https://discord.com/invite/5RmY6J2N7s">Discord</a> to share what you build.</p>

</div>
<br>
<br>
<br>
