Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591C3E835E;
	Wed, 10 Jun 2026 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101842; cv=none; b=a7+wgI4kmJ4YnRNlZU5BwO3v7T6oNSgFpMlxlw8/S66YUHziYrhYbNb+KmGX8jiFSu6ypOiDV8AxT6eUOui6ckvTQJ2FjYSfdwev0v5+k68ZLLCYaESnq0A+iPmwLADNqIIld8TAcpqFoae8gnKNfkHJYuswATCnIZHIWbOkmLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101842; c=relaxed/simple;
	bh=NQ/tlBmxPZuUWTzKOecs8+Km4H9M62EC2ZhyWmxKlpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiwHJN5H0t7tEnnBu+tzClhXchRYIF55n3Qkf5FvcZnr9BVd86L60iZJBB0qhrh7tKxCXnh4TVHVnafJHMDAwcYcYXNzJhg33bpyXJfTfWbA4a9JHS1mFCYSbey8W++uZVKQ1pvn0qwRuVBWk9zGm6+hMwFmug3vq1iKTAQXQ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYRrzC0v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYRrzC0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91C61F00893;
	Wed, 10 Jun 2026 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781101839;
	bh=KNOcTEPB3eNy1kRdGjFNuS7jozRPNVYyaIHvKugUR5o=;
	h=From:To:Cc:Subject:Date;
	b=aYRrzC0v/9Zr/WZaxEbgfDAO+e5ki+3Ag8uQULBzCZ3ImkbCd4HS9OphqaxTNUffA
	 0msK278jzaDuW6FFn8V4ZZjlZtVs5iZeScyluBewbEBM3jxfQeyVmx6r5zTQufszsj
	 hFevX0fb6LQn9iMxs6FIjFJNa8g7Z0YMp9p031NtpJVoBbbCEr6AyeoW7q2kpuQ4fv
	 2nOiSrNnPn5swVfhCSXOvx6G8j807VfAZflgJRneA0G9FJJP4cs8Lsn3BTwColF0Ar
	 0ukkVhfcsri7vasloLKE2PFhgoOxInPwF0ZL89nJokFydrtjr90Jszjah922kF6dSz
	 OW1hy3pVEhA/Q==
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
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: rust: clean `zerocopy-derive` in `mrproper`
Date: Wed, 10 Jun 2026 16:30:25 +0200
Message-ID: <20260610143025.368801-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like for the other two Rust proc macros, remove the artifacts in
`mrproper`.

This should have been part of commit 506054980429 ("rust: zerocopy-derive:
enable support in kbuild").

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c71c43bc3658..8235b6a9b3cc 100644
--- a/Makefile
+++ b/Makefile
@@ -1705,7 +1705,8 @@ MRPROPER_FILES += include/config include/generated          \
 		  vmlinux-gdb.py \
 		  rpmbuild \
 		  rust/libmacros.so rust/libmacros.dylib \
-		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib
+		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib \
+		  rust/libzerocopy_derive.so rust/libzerocopy_derive.dylib
 
 # clean - Delete most, but leave enough to build external modules
 #

base-commit: 8d49d90fb9f0fd5a0355b4b705395c9ba833415b
-- 
2.54.0

