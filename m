Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C273FCB00;
	Tue,  2 Jun 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421455; cv=none; b=HJ1Fd9fecsq3Xv/aWLaZKKL5/Ckp6AkoIPST3XjYOkxEmcqQwbfyEbz1Nsa5IQdokOLp0ngPaT40RYdj+kvbKMfmanJlLJ1sJq/w3k6FXSe7H56o06mc71b9aibwnewPqyKDVzVEKvkSe83PCV5cgk33WFe0j3RG1dYogpMfsyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421455; c=relaxed/simple;
	bh=YJ5m6/ulTbnrEEeFTg9Vscrx/T3tuLKcMmRYJ5pxL48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmRgRWyJqStWwAZrvzk+v9mJPCHu5Kn/+omVC/RYg3gZeUkv8P3xsGpexK+kRdY8Px+MvnaZxOqf8u0VhGZmGsa1Jwhh126+YjMHu2RbfCUmkgFhgYE5bViQEMGsQ+ugWTqArr7GIpqAph+9R4cqpuGalXG6wULTAg82AE8jhuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Llb60xBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Llb60xBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B441F00898;
	Tue,  2 Jun 2026 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421454;
	bh=ILvKf0BPscQBphdp31Fnt/aQV0xIaAfTkPljnxzm0uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Llb60xBKANPuAnoyTZPChckY0gjM1OFsCIp33dWkCBgOcS6sQ74gpPZ2wdLa0Vmj3
	 XYtCbbQ3IKnG2OaHbpEjsb47CTWkKEglDeWgtpcSansoj55CyKYGGcTg2ypGtGWosx
	 Q/mkmZBOUMPFReXQqPWq4awI4etg2i1WDjf+Dup9JpKTwpXTu1m7xOd8uW1oqJSdhM
	 /J3ygHgqerWAn6GWMyMo9W7n2AmNWKZ84aYQBbiW1CNTcGtaD42tT9SkhKbc9u1jwY
	 7cmsaVpPOdPI9ZGKAOJo/5KVp7rWVE8E6RU+H8PPrV7eTCsHfvoi/XAL82+wWwCR+w
	 Sh+M+H2Gcnrcg==
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
Subject: [PATCH 18/18] gpu: nova-core: firmware: parse `FalconUCodeDescV2` via `zerocopy`
Date: Tue,  2 Jun 2026 19:29:19 +0200
Message-ID: <20260602172920.30342-19-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have `zerocopy` support, we can avoid some `unsafe` code.

For instance, for `FalconUCodeDescV2`, we can replace the `unsafe impl
FromBytes` by safely deriving `zerocopy`'s `FromBytes` and then calling
`read_from_prefix`.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/nova-core/firmware.rs | 5 +----
 drivers/gpu/nova-core/vbios.rs    | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6c2ab69cb605..d97da0c0856d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -48,7 +48,7 @@ fn request_firmware(
 
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, zerocopy_derive::FromBytes)]
 pub(crate) struct FalconUCodeDescV2 {
     /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
     hdr: u32,
@@ -84,9 +84,6 @@ pub(crate) struct FalconUCodeDescV2 {
     pub(crate) alt_dmem_load_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for FalconUCodeDescV2 {}
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ebda28e596c5..3f8adfc2e4cf 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -1011,8 +1011,8 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         let data = self.base.data.get(falcon_ucode_offset..).ok_or(EINVAL)?;
         match ver {
             2 => {
-                let v2 = FalconUCodeDescV2::from_bytes_copy_prefix(data)
-                    .ok_or(EINVAL)?
+                let v2 = <FalconUCodeDescV2 as zerocopy::FromBytes>::read_from_prefix(data)
+                    .map_err(|_| EINVAL)?
                     .0;
                 Ok(FalconUCodeDesc::V2(v2))
             }
-- 
2.54.0

