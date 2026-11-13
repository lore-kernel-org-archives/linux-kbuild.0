Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604171;
	b=AnYbCaRF5WZvR0c34UuYtgVu25I68kuBOH7YqjAoyj6ctYHbBmOaOg3HdN8YxxGxNJ7G
	 tsN3gyuNJFLO25kWKAK2ib+4TJv2ZZaHXFnb0NaYaaaPuhXOBoX6WUVke1wp1uNmB5oou
	 7vqABB450lTXSIZBunl61bTPC+zsZBKL3lJyvhbTECEUHOSmFlk3KbsiJov0LBucbhA4t
	 1mD0PF+XqhwkNIrP2egYAo3Fym0l+wLbLt44+ZT3CyOGgL+D8Hk9GaDuVA8DfSoIGP5qI
	 Qnfy1Gkf0OUPlQT33p2RiduH/MPalu169VAyviCu8fkOD6H7954QyafIS1e1nynQY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
	b=LWTHRTqs6/afVkF12aVVkswR3J3BpIQGow1DkXhlHV9hcdN4Uj3+AIivg99ToTRF1KxC
	 adiSw8pzm+8w3vxTXgRTCB3j7Jm8HBeRinlAYFm4Qg60fJ+LQ0+SZljFqpy2+fG9qkqPc
	 eb9J7jNUD736wPmEMIoHXQQYfLz10HjwQBDj06ojtijY2WjdNxZshU284WmkJN9nlRJU/
	 WuunKVIWmDdTSUMgbsbt6VhsxaTC/cnbdap5R4p4npSqHXe0kb22CYOKCm7cdyY5l9CmU
	 JGLUB1cvtn8cFtm1DX+nmQw/iVEGbdxsAht5fg7r8F7s4LPRMf3aiHmK3HK3jkOWR5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="byh/3nmq";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8203B60A260B
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 21:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8203B60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=byh/3nmq
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so1745143c88.0
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604170; x=1795208970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=byh/3nmqI7QpjTJjL85XL36XrLVmQJX7b416OaueMm9iHjof1uYq2ZFN7Pfll3IAvV
         +X01S5m5HOaYZHlDiDaPuFiRmYKrPA+w+1JW7YhJqoVFFPJEGnEmqMTcrdwrPGVV8Zz4
         i1lGy4B/V1v3WY/ao6ofASJ8TCWkgzDrO6u/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604170; x=1795208970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=TieduJ1FLT/+8WROfhWM74XWYdMCWZrAmjv7DwbUs6jwYQYDsUN6ZcQsp7MIKcKSg2
         ZeRLvNTQKMgK4XzXMnkZNxjPw61p1qIHnZGqdBehEwjt1I/KNC3avZ6KCvTFBoSFl3RN
         2jSM2scEqwm91pw01LTSWtZrqZtsPKyk069adzZufXCEK8l8dF1JBfaW+2NlEK3QuhYo
         IAWfOuxD8OqVwaH+PRrhcXsHAgJ4SnHkhi0aRA0qe6xCOdEjtc/elcfbadnaON/1gPuH
         Yadm+l2nCd7+PT6o2ZNxuPXs980shhv80HEuwnAcUCiIqMHYDJBkw6/qH/zlTYoqRMqw
         bAIA==
X-Forwarded-Encrypted: i=1; AL+hErFBqU7tXKvxl3t2cr8TlC2RhGuelooQnkR1uj0UbQEFjSeSdwnlO8mS3eP2TX9UhfL4l9w5aP5qrelCQIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2ZLzKryRruaCOdc+PBC+BTw9tzzhBheBoafn3MjCNIIVCkCfA
	7eyX71r8kYtI//86qgeONxQU7PE/P/gZiQ8V/B4ExoJHvfbF8HgCbgmTf3t3XHYgmg==
X-Gm-Gg: AYBFou0idYon2QlVectxnkDPRGR0hd8NGxv41TYVFti2yWoFNQik4w14whbGAc4hquM
	iH9FQ8/y3RkY/llR8Oe1pi4qHxvn5iDG1jZ+jWDRFtqcPcCicDHIgahvck1TL90l7m1qEY/vMt2
	E5lj+n6BREg5P5Yf7uGK68kI7OQ8TkNtS2KWutEwHV3kZS742tZiSBsmFPadTgwg5FlpQ1q+Fle
	rt7t8qTPJ8edp27qxZ+k/gT81+pwHWALojxFG3nkSACaTVSgCyAV+7x/TbuFD4XEUhafB/Ry5Sr
	OCfAdQJZFt2KcK3Vdu5rXhYnfBc0vP6oaOdUmjijQwZJKjA/5oZwOLpjp+KmfHp9sEekpn2JRDM
	7aeG8Tn2HTjlPjzRcDldILccC7qUud21Ok126zEACyUsNrVgmgRpxyK3zqhbU9k0Cf8e5kXwwW6
	YC5y4r1Sz1oXPR92PDaLZ6A7VMDO078RFTQBG1eWV8sVzWRXJdH5f5n70BPtinfSxPDS4wFTvXh
	7lxhenFeBiDl3rn6Vc9RkzK+vifm4bR/7EQnrpN7WTOAxnhKV0V6+HsXCI0HQEqA3zxyeg2LkaT
	sHcrSxXG165dmDWrQVg5ZiWkWjYD/0/OCRQl9Q7SWvVccSzPbmF7ufPbVCnBsWhnBQOYCOGoeKx
	Xsb+WTLxxkb9u
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr3160476c88.46.1794604169766;
        Fri, 13 Nov 2026 13:09:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 1/5] kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
Date: Fri, 13 Nov 2026 13:09:10 -0800
Message-ID: <20261113130858.RFC.v2.1.Ic9a4337a7740a76d78fb68d3763d36a35a3231a0@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`FIT_COMPRESSION` and `FIT_DECOMPOSE_DTBS` can be passed on the `make`
command line when building `image.fit` (see `cmd_fit` in
`scripts/Makefile.lib`), but neither variable was documented in
`Documentation/kbuild/kbuild.rst` or mentioned in
`arch/arm64/Makefile`'s `make help` output.

Document both variables before adding new FIT Kbuild variables.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)

 Documentation/kbuild/kbuild.rst | 12 ++++++++++++
 arch/arm64/Makefile             |  1 +
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index e71a692a559a..744a32ccbd1c 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -364,3 +364,15 @@ LLVM
 ----
 If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
 of GCC and GNU binutils to build the kernel.
+
+FIT_COMPRESSION
+---------------
+Compression algorithm used when packaging the kernel and device tree blobs
+into ``image.fit`` (for example, ``gzip``, ``lz4``, ``xz``, ``zstd``, or
+``none``). Defaults to ``gzip``.
+
+FIT_DECOMPOSE_DTBS
+------------------
+If set to a non-empty value when building ``image.fit``, decompose composite
+DTBs (built from a base ``.dtb`` plus ``.dtbo`` overlays) into their component
+blobs and deduplicate them in the FIT.
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index ed28f94be428..8818d6a2015b 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -223,6 +223,7 @@ define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
+  echo  '                  Configured by FIT_COMPRESSION and FIT_DECOMPOSE_DTBS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
-- 
2.56.0.611.g1030f0b940-goog

