Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FBF3FB044;
	Tue,  2 Jun 2026 17:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421426; cv=none; b=Yym24C5DmUkmWBbEhTyG0HKBZN8ePMvrtwklY6bWoGK3FsLIww+o9n32ovMf1W/nJbNVz4r3BZoFKR+GnC1yszS8S2AmOERNvkUic2Wpq+WBaXZKD96/Az/4RPx4OGDti9RAcccwWIEAVW2QLShIB5V85UZUzErU9YvM/ZhqBFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421426; c=relaxed/simple;
	bh=Uq40QSI1EQhFVweuZjQLs8snaCfHw3tGNvKENftRqVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZlGxVkaBWFBTVBWSX4yZPkBSgjuATHJFC6n2l0mwH8cjFRa3B7zHcxaQTA/zvAGgYs0y5KnU6Df81yzmG8viGzUWgElqiomX4XjeLl9uXvLgDR3kyU8IOk96zcz1wpXYC/Qays4hbwPVHT5vJSXhuKajiX+Po0Xnv5zQ8qN6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwDdexWy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwDdexWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97AC1F00899;
	Tue,  2 Jun 2026 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421424;
	bh=3kWlCcwCn9UIMRsJr7GW2LaR8EiVPYdBYoNzKO06zFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mwDdexWyJI7U/CgBhb92O9UHVQmRuLKDU+Oot3JdmpoJX0MlvOwp6gQlMGKXybVNY
	 XruLxrNjAK1R8ZrViu7SexFvm3+iV+80rbRkQFtzhwUZcA4svgjDMNZHVeo9RAqF/D
	 54sfMnQieqCifBl64WU29TUCXjPIKvBsioafFJAy6iHiJIMgx3BWqVfEYlTloIO289
	 37CmahEG2vXD8Noq3O/QuIIoE1F6WGACdPLIYrZ1WMCvGaLl3UVlUxKkK+A7zBozl6
	 SIF+9KMWtBxWcJTuPmiG0wzTzruSLVLAirWi/vtjrip3Mlra408yPcyosyMuVycSmb
	 eC7zFyws3q3gw==
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
Subject: [PATCH 10/18] rust: zerocopy: remove float `Display` support
Date: Tue,  2 Jun 2026 19:29:11 +0200
Message-ID: <20260602172920.30342-11-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel builds `core` with the `no_fp_fmt_parse` `--cfg`, which means
we do not have support for formatting floating point primitives. However,
`zerocopy` expects those implementations to exist:

    error[E0277]: `f32` doesn't implement `core::fmt::Display`
       --> rust/zerocopy/src/byteorder.rs:172:29
        |
    172 |                   $trait::fmt(&self.get(), f)
        |                   ----------- ^^^^^^^^^^^ the trait `core::fmt::Display` is not implemented for `f32`
        |                   |
        |                   required by a bound introduced by this call
    ...
    907 | / define_type!(
    908 | |     An,
    909 | |     "A 32-bit floating point number",
    910 | |     F32,
    ...   |
    922 | |     []
    923 | | );
        | |_- in this macro invocation
        |
        = help: the following other types implement trait `core::fmt::Display`:
                  i128
                  i16
                  i32
                  i64
                  i8
                  isize
                  u128
                  u16
                and 4 others
        = note: this error originates in the macro `impl_fmt_trait` which comes from the expansion of the macro `define_type` (in Nightly builds, run with -Z macro-backtrace for more info)

Thus work around it by skipping those implementations in `zerocopy`.

Ideally, `zerocopy` would have the equivalent of `no_fp_fmt_parse`.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy/src/byteorder.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/zerocopy/src/byteorder.rs b/rust/zerocopy/src/byteorder.rs
index 36ca4c0c88b0..8f70048f1eb0 100644
--- a/rust/zerocopy/src/byteorder.rs
+++ b/rust/zerocopy/src/byteorder.rs
@@ -177,7 +177,6 @@ fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
 
 macro_rules! impl_fmt_traits {
     ($name:ident, $native:ident, "floating point number") => {
-        impl_fmt_trait!($name, $native, Display);
     };
     ($name:ident, $native:ident, "unsigned integer") => {
         impl_fmt_traits!($name, $native, @all_types);
-- 
2.54.0

