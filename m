Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC33CC9E9;
	Mon,  8 Jun 2026 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928189; cv=none; b=IrIlTkenaqQSomGe12wPknaxv5aUzOETfM7B9flEhnidpzrOYueWIR3O9FZ6snPxijIYwXy8zbzKQCrmBimqdMTM7NQE2PsuZYSpcK1EQF2FTg87P73Anf6tquM0kbTGRCLPseiSr81VQp/vEO3b4us+X9xhrNkPmlZj/bZfg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928189; c=relaxed/simple;
	bh=NEuAFSRgOTTwv0xrG2ruQMGUiiky/0dVXTgTlOdabvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOJmUWLOKz3yaOxz1sKPVPwH2PnuRp+jr2HzdRMKweqkLxULo5a2A9lyh6hLnj5nlEJNCFG5cWSvkEoT5mdsFBYE4c3sZFbwZamGUBcKPLXo+2bmVUUIm066sYHf7XH35OMEW6Aii3YbKKhgzXyKeI3TSvLlM6t32A/aagjzmA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCVlU0rg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCVlU0rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB3C1F00899;
	Mon,  8 Jun 2026 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928188;
	bh=ldBTRuqKGHs0hf19IABp5Lxvl1GLxwrbvIL85vbKCsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WCVlU0rgZH+sDvOV3rTpf78iHOdv8FvTetWaqORgBFtQTcR5oCce9eKYZiKSJoTdC
	 olKAMfW7uED8wFYy1FPDAal3WPA1zL8Dt3grA47AiQdtVRViivkpHszjlR1Vz3VeqF
	 lVtTlcw3nxbGNBt42Aam5Y07wqZAZce8Dr6H5uE98MUKiWLyc4mtRrvjWzT06OOb3+
	 cxkHuA616B1xOOqrsz+tkAscO2zQybTHY9X86YVEnn1CghAyITqO62j21oLMECFh0S
	 lk0KVDgcS3kQZ7FU1b/M7AJ5yBtQdBuE7Qgpp1V47irediy8pFUqoFWPKQ2hzVYiSm
	 fpOoocMXUHPuQ==
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
	Jack Wrenn <jswrenn@google.com>
Subject: [PATCH v2 18/19] rust: prelude: add `zerocopy{,_derive}::FromBytes`
Date: Mon,  8 Jun 2026 16:14:37 +0200
Message-ID: <20260608141439.182634-19-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to easily use `FromBytes`, add it to the prelude.

This adds both the trait (`zerocopy::FromBytes`) as well as the derive
macro (`zerocopy_derive::FromBytes`).

We will be adding more as we need them.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/prelude.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index bcd4e7f90bc7..ca260cc3937a 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -60,6 +60,12 @@
     Zeroable, //
 };
 
+#[doc(no_inline)]
+pub use zerocopy::FromBytes;
+
+#[doc(no_inline)]
+pub use zerocopy_derive::FromBytes;
+
 #[doc(no_inline)]
 pub use super::{
     alloc::{
-- 
2.54.0

