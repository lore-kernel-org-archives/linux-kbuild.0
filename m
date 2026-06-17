Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDA43D50D;
	Wed, 17 Jun 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705413; cv=none; b=dVmAgPuhY3mSJTY7O+U+kYHebZCW9Ag0PndAbYINARecVY4Mz98KekwtPBVVob3OlWZ0nBvkVr8m0v40mNdOubHXkYE/b1MqEN7P2HboVMXoHEeM4QbunBSUhv5AL+4/e3PAAWQOeANqBSfHNquVb7aZMgwYbhWgK89+udj28vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705413; c=relaxed/simple;
	bh=dj1IGQMI/LQM4LwLQxCHnanVRWDX0tdlF4AZTK/EWUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=laRw9+ONsTlbd1yUP9PRFuF38h2IWmMtZN1uY4GrfQO7GC/gbE8GshaZ79gyaO/scgJKlc5ay2LdsIdaSrixY7MT6kmIoE6gX1napzRRCJI/nQX8Fym7kNOt6mxOmugHAb06cu6vUfi0qDy2K1tS1g0CE1lLoNDbQdWAsi2qMic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a32aab9-97ff-7f0000032729-7f000001c70e-1
	for <multiple-recipients>; Wed, 17 Jun 2026 16:10:01 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 17 Jun 2026 16:10:01 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Wed, 17 Jun 2026 16:09:48 +0200
Subject: [PATCH v2] rust: kbuild: Replace and dissolve procmacro-extension
 variable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
X-B4-Tracking: v=1; b=H4sIAKyqMmoC/42OSxKCMBBEr0LN2rFIVBRX3sNyEcKgo0JwEig/x
 d0N4AFcdlX36/cBT8LkYZ98QKhnz66JQS8SsBfTnAm5jBl0qrM0Uwql8wFvRcf3EoXau7GErTh
 bGysO6RmoGRmotV1vcqPXq52GSGuFKn5OT8fTnH1XXMmGEf9rCD26qBDmGhTGE1pX1xz2Sb9dK
 hiXF/bByWtS7tVU/Nllf9v1ChVaU251nu8qQ3SohMN7Gc/gNAzDF3zU2h8YAQAA
X-Change-ID: 20260611-rust-kbuild-replace-procmacro-extension-22c459a24382
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=dj1IGQMI/LQM4LwLQxCHnanVRWDX0tdlF4AZTK/EWUo=;
 b=kA0DAAgBiMa8nIiabbgByyZiAGoyqrig1FqExSoSiNeJYZbHWmddRB4VZaF0F1h9SsIaCdNGV
 IkCMwQAAQgAHRYhBA7/hYnrdOmB5wukaYjGvJyImm24BQJqMqq4AAoJEIjGvJyImm24NcIP/jKN
 cRv7+o4SeprrkWCa3vupStO19iZsv2bNmXY6QLxI4zr2oGx6UBxi49//oyFDO6P++ju4/g7wo0l
 oVXumlrYHVzBECL+6qGVhcHtrkLe+0sru0o0woZBPFbNaZriIgqoJBI3CXA8LBtOP8KUAMg1/9A
 DAsC7SffZYVvulht0NfmO5WYaFK+QmUq8pN5hx+s+liS3BfN9ej2H7CtwS6uy42UHzHON81x5vZ
 7UMowVidd4OBDpOlN3xYF8eauFuwHrV0l37O1x0Bs1RwWN232NdzmOPCkxHpD8rHgSFpJHYsoJj
 qxhAYk60VvpIjIlMYp4GKGkdYsKGcpqZyRtOr945bWgDxFREx7P2FTFAe+USDF/xMZcxPSAhRKN
 QUsRDzLawfgdH8b5Y2SntuOjBaOb8FNRSDfbFbZV8OlA7/38qaaqmBA0TJXfCIMfkitaOynfo1M
 ttuu+2lwxy1LiciDoPg5rzb7h9iLE1OFIojmqLVzrSdLJko2OLtsTnGggu7QiDuRkfOqueASk9S
 X1rbbXhlbZZ6By9txUmiq0k+f3EYEqJp7BFtfT+0+WuXU+c/82VZsKJ6WgpEIR9HP4LRjaOpgeM
 DfWw93mSy8SUHv9xg4P04utvssrVJLGT3AJJUDL/x1FdRUI2mWHpQ/mbGi3eogTKbPxkVPy0mFa
 Q6tRj
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1781705401-FA4DBAE2-023B2B94/0/0
X-purgate-type: clean
X-purgate-size: 2642
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

Use make's $(basename) function [1] and substitution reference [2]
instead of $(patsubst) to extract crate names for rust procmacro
targets.  As there is only one user of the procmacro-extension variable,
do the crate name extraction in-place and remove procmacro-extension.

The procmacro-extension variable is used to record the binary file
suffix of dynamically loadable rust libraries -- which is 'so' on Linux
and others and 'dylib' in MacOS -- to remove that very suffix from a
target file name for reconstructing the corresponding crate name in
cmd_rustc_procmacro.  Extracting the crate name from the target name
in-place is shorter and reduces complexity.

Link: https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html # [1]
Link: https://www.gnu.org/software/make/manual/html_node/Substitution-Refs.html # [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Tested-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
Link: https://lore.kernel.org/linux-kbuild/CANiq72nmPPF=6AUp5mcDJVni80ORQr0AQ-4uCZaE+CzB5kV=eg@mail.gmail.com/
---
Changes in v2:
  * Let commit message reference correct make function
    (suffix -> basename) (Tamir)
  * Cc kbuild
  * Link to v1: https://patch.msgid.link/20260616-rust-kbuild-replace-procmacro-extension-v1-1-cad72998faee@fritz.com
---
 rust/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index a870d1616c71..73f0ec4a3e90 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -50,7 +50,6 @@ endif
 ifdef CONFIG_RUST
 
 procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
-procmacro-extension := $(patsubst libname.%,%,$(call procmacro-name,name))
 
 libzerocopy_derive_name := $(call procmacro-name,zerocopy_derive)
 libmacros_name := $(call procmacro-name,macros)
@@ -599,7 +598,7 @@ quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET))
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro -L$(objtree)/$(obj) \
-		--crate-name $(patsubst lib%.$(procmacro-extension),%,$(notdir $@)) \
+		--crate-name $(basename $(@F:lib%=%)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.

---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260611-rust-kbuild-replace-procmacro-extension-22c459a24382

Best regards,
--  
Nicolas Schier

