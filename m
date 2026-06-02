Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EB3FADE5;
	Tue,  2 Jun 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421389; cv=none; b=ICVxb8D0Bhq3Ygvqb3DOkEqdkLZBKBef6AIfgwZglaHkvIyPZag/5k+wGBaqyAvl/HoYOW0Nv+qmHNvEISaFxDxZx0Qq+2Bj5ciEo2D/TE5P0e3QX9xlROAzkpakthttD8jyuW288mJ0SHjhab5wnmJ0Ibs6JqFiw7U2ctaDbts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421389; c=relaxed/simple;
	bh=IJsiEH8Q48V6vwUibQtE5rZ+UjTRy+PbQKrnoxU77qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUb7ijWvw4IM6qzLV5lTCrVUpEMhALFJmD+vRuQ3/95CK3MVpYN3rzIDm7w2BkGN930OKo4oGRm0kFaTNnu2e3MrPYLN2sgnSbPaJza+PW058kZbHNiMbLKvpIsJd20vjumgBJVrTZdaTeB6vOCap4S25DXpKYyNy4tP6qPAS2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfZmn4VG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfZmn4VG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A95F1F0089A;
	Tue,  2 Jun 2026 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421388;
	bh=FhO9fck3dskb7DHMI3NRQ0f8eEQSztkzaKlfBxdvYQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LfZmn4VGVxMQj7utQNZYu0YF3UxRMgzUtO3top+W4XQPa3cnLwIe5W8xEAaoUgu8i
	 HAiUxHgO8q7ASBdRiimP/XS6Ac32oZfX4bbK8vNT2abkT1gH+doUBTJqj3eHwtFImo
	 7HGImggGPZEF03FKpkN3DRnp0CmMw32PE/9a/tWYeAWmuaN/VoRhwHRp11UUccjaRr
	 p4V16reRaT6gt79fDWTmd2fnMbJ+4JkgSMW+Yo3NThn7PWAMXTieOVboDwD4unWXKS
	 OWSJt9Hw1kH8ixLt/Aso9up4UYyICq0lO8/XgJZ2OzsoDWjeto4JK+Qczea0y/Zlxa
	 +WyIJuJUeJ42Q==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@amazon.com>
Subject: [PATCH 01/18] scripts: generate_rust_analyzer: support passing env vars
Date: Tue,  2 Jun 2026 19:29:02 +0200
Message-ID: <20260602172920.30342-2-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A future commit adding `zerocopy` support will need to pass an environment
variable during its build.

Thus add support for an `--envs` parameter, similar to `--cfgs`, that
allows to pass a map of variables to set for a given crate.

This allows us to keep a single source of truth for those values.

No change intended in the generated `rust-project.json`.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/generate_rust_analyzer.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d5f9a0ca742c..cede76af8425 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -26,6 +26,14 @@ def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
 
     return crates_cfgs
 
+def args_crates_envs(envs: List[str]) -> Dict[str, Dict[str, str]]:
+    crates_envs = {}
+    for env in envs:
+        crate, vals = env.split("=", 1)
+        crates_envs[crate] = dict(v.split("=", 1) for v in vals.split())
+
+    return crates_envs
+
 class Dependency(TypedDict):
     crate: int
     name: str
@@ -61,6 +69,7 @@ def generate_crates(
     sysroot_src: pathlib.Path,
     external_src: Optional[pathlib.Path],
     cfgs: List[str],
+    envs: List[str],
     core_edition: str,
 ) -> List[Crate]:
     # Generate the configuration list.
@@ -74,6 +83,7 @@ def generate_crates(
     # Now fill the crates list.
     crates: List[Crate] = []
     crates_cfgs = args_crates_cfgs(cfgs)
+    crates_envs = args_crates_envs(envs)
 
     def get_crate_name(path: pathlib.Path) -> str:
         return invoke_rustc(["--print", "crate-name", str(path)])
@@ -92,6 +102,10 @@ def generate_crates(
             is_workspace_member if is_workspace_member is not None else True
         )
         edition = edition if edition is not None else "2021"
+        crate_env = {
+            "RUST_MODFILE": "This is only for rust-analyzer"
+        }
+        crate_env.update(crates_envs.get(display_name, {}))
         return {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -99,9 +113,7 @@ def generate_crates(
             "deps": deps,
             "cfg": cfg,
             "edition": edition,
-            "env": {
-                "RUST_MODFILE": "This is only for rust-analyzer"
-            }
+            "env": crate_env,
         }
 
     def append_proc_macro_crate(
@@ -347,6 +359,7 @@ def main() -> None:
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
     parser.add_argument('--cfgs', action='append', default=[])
+    parser.add_argument('--envs', action='append', default=[])
     parser.add_argument("core_edition")
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
@@ -357,6 +370,7 @@ def main() -> None:
     class Args(argparse.Namespace):
         verbose: bool
         cfgs: List[str]
+        envs: List[str]
         srctree: pathlib.Path
         objtree: pathlib.Path
         sysroot: pathlib.Path
@@ -372,7 +386,7 @@ def main() -> None:
     )
 
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.core_edition),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.envs, args.core_edition),
         "sysroot": str(args.sysroot),
     }
 
-- 
2.54.0

