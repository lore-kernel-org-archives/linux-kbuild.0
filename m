Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE471547051
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639139; cv=pass; b=N2XTIysyOP6wWfMwiJJMllyXYgQkygLprLwFWUPEs3KeznfPcwXquogr9s5EBQM8we5nregxWVXyvA+ySYhCqbduoUzI9CjFjAiKo4G+UvFRWtIqfjC51WLZ4Tml6kKg65gnHLclq/E6sFm/JfqfT/7+cIHAPjPxh2dvMD21rWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639139; c=relaxed/simple;
	bh=kPt0aqOU/n4gdjbTJoki1cMSqFBO3bQbhyVv70dBjDM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RJ8fdiv5q5w0GXwMpOaaMzcinKXKYRkVWpIhJT6/fhovjPfM3xMGTXvqKpc7zQ2kjIy3ntotbX+41UQkabb63NeTMV41UqZZnrpSGwa/k2k7ejAfWfIEyzPwjC3ndU/mvj6hgrP8hQgso2/slx1UZiDpUr0q30Y/7QHEFKciVPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJC1uc4M; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJC1uc4M"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a650281d5fso21462321fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 16:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639136; cv=none;
        d=google.com; s=arc-20260327;
        b=hwjBENCfornK3+VC7r6qVPWQj337HFf9/tYNnIDcTezGxzz8k98smMU5SK7gAT1Ma4
         U9a4VdT3w+SyiXNNY3795yQjj+K7xcYTUR+ltBdLoJF1z6wDvF+yKGcn6oDGF5pTYP+E
         8WX6BNcqOSzPbPs5Ltgt34g75H0QabkqLVYPRmTdcYYgN0HMwmwaecLzUObz/t0AHF7B
         wy4CfV6tKGueJ4SPl9Xykvj118VyKD3lhneGhHaSSS6Ca+j6iCseYPaKgLzE4onGXJRS
         BISUTaK0q94jA7aJz06QqCpipj1QpX5JTyCny4nPRNX9bEiVkz5GQ01NMeIb+sIDwNfy
         1VMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Yi8yIXuTQIw+JsvOxv0o+E9SV/fn/IVa/r9cGOwYT2Q=;
        fh=3DU4OnSdLzvy5saq48DIdFVRpZYflcxwoQkdEourx8w=;
        b=GZfXv34keX+Jeeu3NzpPXv/Piv+wVvHCwVtp2IZUGEZYLiSgC+QeGphqNsjLD1MujD
         xgeoIDfoItNXhwaGvWXp43gUY4MkIsDX6l4nrV7/2h68v7fdyhPIlXjhmdZngzb28+nU
         yyRXbceoCH1cBIck/F5Ovn7pHB0OkFrVCDZh9s0gMOIZz7xlY2LVL4wNoOWshdtrQvj9
         BLAgmH6sfXkD2UOFHUaLTcgKfJtdUzMIK6TFF8Gx036CmcvFDhnbaQqQXJV9ySpbxB18
         bdy6nDye+JXG0Z8CqpkjqePUG//GWhB9AqhvL+mXf+Ziqtfesiy2m3i1XBgccgTL2yLo
         1+0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639136; x=1791243936; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yi8yIXuTQIw+JsvOxv0o+E9SV/fn/IVa/r9cGOwYT2Q=;
        b=cJC1uc4MmurkcxezzyMTULikBkyvpVMG4v7vReRK+fnLhL3/7axAETRvX/u15yp6MR
         u9fwdNlZGWBw2FQuZiNAq2s23bieFDDJyRLxQa5nXxJpujTJD4llQuYXdZsFe3UfPsje
         hJjH/3JJ79VjdY2yWVjbVxcPeW64Pwn1eaf3j5N/kn0x6/JohL+JLyF8Oq2h5l6doL3K
         mnjBEzK5mfqftfyZhDhynBm3G1B2rS3VoWDNpq8WSnk1YRWtDHjbmNC611hLf1XJtCD+
         7VKOyYWEkgz81E06kpL0mAs21jKbpuZBA0PjXxIEB28dZyip8vIxguGb2fHI/Em5exSo
         M9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639136; x=1791243936;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yi8yIXuTQIw+JsvOxv0o+E9SV/fn/IVa/r9cGOwYT2Q=;
        b=G48NT9ZRvWPN+8zlkhdY4M1L0xPg8csAbFccORgqcNeKnyQwk+Lik7MIqJmGm14reX
         Uec0HFhlamZR19QNMTWQsKxjpBPQoWCuAfNA+ZLSr4A+88Dj+TYY7WbmWa8QPEgSiyfz
         7Fc5k99vnO1W/daVSFDHmI0GLrUO2x21Psnzoc2h5xvRJwIg6FeSSMGpd6yKapIsMG/h
         k9CUhaebyhmzcxBikUtlN3dq4YY8tMBsEpUvrVNSW0VvFHRfpv0gBkUDbmMHtGaynnkr
         +vn/mwdznPs9Agj+kRHkt92Iujl2yX1LTzN6P9idXTJExkyCaWKO966qDSwjUwtMvkT0
         9tTg==
X-Gm-Message-State: AFq9FYLcY3STrjdmKVbHFLgjEhG8lonnGZJ6JQ0gfmPecgJn61NFjmb3
	SG/pi7Hp0g0Gsbq948g85AU6HTxcVwG9XZEDTvfuS1Pz+KcbL84nYqQ9gOmw5Z/0V4k0lUXz810
	ZtXAImWIsFOh2sk2dEutIwV0/YlKp6X8=
X-Gm-Gg: AYBFou2ZrSeDieH9rRvvyI92qBBV1W2j2tpyxZG3NRuwtEjVCJce5BuM3Bqx3AOSSlo
	iEFomBLl7Knx91uh0ggc8+Gt9COuZAD7OsOLCPqsibGVTaVjfM8c11TCc84HCgzwuO/TwFnRmjm
	rfZDffH7KutBQAXNuhm5LOgFma6ud1kd4s6WB5obhKSW1QEgVyVmi+7nlUQV1fLEdqojVtjdlSj
	I5cMGdJJAeGGgVe7jwrgCFmtum3/Zy6f3SOUEQvcwm5huR451I7jZlQfiEyAy+8NrpS7SJDvOo5
	fPnvf+Iei/wP5Jtn7SasPwXiR2+iX98WWNX5Jqjd1tKX66brol97XMI8HZi3q93Glr86JHwwbm0
	85JEXb8c91jtGZHhdwIS0hfApbERF/cmB7QwoQdDvuz6tItwH3n5pv+fdPS3RrPpwER6HJ2A=
X-Received: by 2002:a05:6512:b96:b0:5b8:9c46:d4d1 with SMTP id
 2adb3069b0e04-5b8df1f3d0bmr5168466e87.32.1790639135820; Mon, 28 Sep 2026
 16:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:45:22 -0400
X-Gm-Features: AclHuK-mvnM-4uImxnKIJOrGolLuZvCHcejArW2uJ2903EtNAjJ4_qYabJ1G3No
Message-ID: <CAGLNFZcFDMD7P3rwueV4eRQ4qvDU4ekyzLmYTFq==5fUZxMBmw@mail.gmail.com>
Subject: [PATCH] kconfig: keep builtin precedence with duplicate fragment entries
To: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000009ca7fc065c93a976"

--0000000000009ca7fc065c93a976
Content-Type: text/plain; charset="UTF-8"

The -y option is meant to preserve a builtin value when a fragment
requests a module. With duplicate CONFIG_FOO=m lines, only the last
fragment line is skipped; an earlier one remains after CONFIG_FOO=y.
Kconfig reads the later assignment and can demote the symbol. Track
the symbol instead of one line, and skip all of its assignments
when builtin precedence applies.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--0000000000009ca7fc065c93a976
Content-Type: application/octet-stream; 
	name="03-kconfig-duplicate-fragments.patch"
Content-Disposition: attachment; 
	filename="03-kconfig-duplicate-fragments.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwat900>
X-Attachment-Id: f_mulwat900

RnJvbSBlY2RhOTgxYTEwNmY3ZDk0YzZlNmZlYjE4NGNiY2ZlMmU3MGI5YzFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIGtj
b25maWc6IGtlZXAgYnVpbHRpbiBwcmVjZWRlbmNlIHdpdGggZHVwbGljYXRlIGZyYWdtZW50CiBl
bnRyaWVzClRvOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+LCBOaWNvbGFz
IFNjaGllciA8bnNjQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3Jn
LCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCgpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnph
bG1hbjQyQGdtYWlsLmNvbT4KClRoZSAteSBvcHRpb24gaXMgbWVhbnQgdG8gcHJlc2VydmUgYSBi
dWlsdGluIHZhbHVlIHdoZW4gYSBmcmFnbWVudApyZXF1ZXN0cyBhIG1vZHVsZS4gV2l0aCBkdXBs
aWNhdGUgQ09ORklHX0ZPTz1tIGxpbmVzLCBvbmx5IHRoZSBsYXN0CmZyYWdtZW50IGxpbmUgaXMg
c2tpcHBlZDsgYW4gZWFybGllciBvbmUgcmVtYWlucyBhZnRlciBDT05GSUdfRk9PPXkuCktjb25m
aWcgcmVhZHMgdGhlIGxhdGVyIGFzc2lnbm1lbnQgYW5kIGNhbiBkZW1vdGUgdGhlIHN5bWJvbC4g
VHJhY2sKdGhlIHN5bWJvbCBpbnN0ZWFkIG9mIG9uZSBsaW5lLCBhbmQgc2tpcCBhbGwgb2YgaXRz
IGFzc2lnbm1lbnRzCndoZW4gYnVpbHRpbiBwcmVjZWRlbmNlIGFwcGxpZXMuCgpTaWduZWQtb2Zm
LWJ5OiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4KLS0tCiBzY3JpcHRzL2tj
b25maWcvbWVyZ2VfY29uZmlnLnNoIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2tjb25maWcvbWVy
Z2VfY29uZmlnLnNoIGIvc2NyaXB0cy9rY29uZmlnL21lcmdlX2NvbmZpZy5zaAppbmRleCBlYzI0
MmUwLi44NmE0YWY4IDEwMDY0NAotLS0gYS9zY3JpcHRzL2tjb25maWcvbWVyZ2VfY29uZmlnLnNo
CisrKyBiL3NjcmlwdHMva2NvbmZpZy9tZXJnZV9jb25maWcuc2gKQEAgLTIwMiw3ICsyMDIsNiBA
QCBmb3IgT1JJR19NRVJHRV9GSUxFIGluICRNRVJHRV9MSVNUIDsgZG8KIAkJY2ZnID0gZ2V0X2Nm
ZygkMCkKIAkJaWYgKGNmZyAhPSAiIikgewogCQkJbWVyZ2VfY2ZnW2NmZ10gPSAkMAotCQkJbWVy
Z2VfY2ZnX2xpbmVbY2ZnXSA9IEZOUgogCQl9CiAJCW5leHQKIAl9CkBAIC0yMjQsNyArMjIzLDcg
QEAgZm9yIE9SSUdfTUVSR0VfRklMRSBpbiAkTUVSR0VfTElTVCA7IGRvCiAJCWlmIChidWlsdGlu
ID09ICJ0cnVlIiAmJiBuZXdfdmFsIH4gLz1tJC8gJiYgcHJldl92YWwgfiAvPXkkLykgewogCQkJ
d2Fybl9idWlsdGluKGNmZywgcHJldl92YWwsIG5ld192YWwpCiAJCQlwcmludCAkMCA+PiBvdXRm
aWxlCi0JCQlza2lwX21lcmdlW21lcmdlX2NmZ19saW5lW2NmZ11dID0gMQorCQkJc2tpcF9jZmdb
Y2ZnXSA9IDEKIAkJCW5leHQKIAkJfQogCkBAIC0yNTIsNyArMjUxLDcgQEAgZm9yIE9SSUdfTUVS
R0VfRklMRSBpbiAkTUVSR0VfTElTVCA7IGRvCiAJCXByaW50ICIiID4+IG91dGZpbGUKIAkJIyBB
cHBlbmQgbWVyZ2UgZmlsZSwgc2tpcHBpbmcgbGluZXMgbWFya2VkIGZvciBidWlsdGluIHByZXNl
cnZhdGlvbgogCQlmb3IgKGkgPSAxOyBpIDw9IG1lcmdlX3RvdGFsOyBpKyspIHsKLQkJCWlmICgh
KGkgaW4gc2tpcF9tZXJnZSkpIHsKKwkJCWlmICghKGdldF9jZmcobWVyZ2VfbGluZXNbaV0pIGlu
IHNraXBfY2ZnKSkgewogCQkJCXByaW50IG1lcmdlX2xpbmVzW2ldID4+IG91dGZpbGUKIAkJCX0K
IAkJfQo=
--0000000000009ca7fc065c93a976--
