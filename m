Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.64.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794105388;
	b=Ry9AhBYAY4RPa4GuGnZEyzZMm2CiTxroW//rGr0LxIM9ANUFmZPOvFwdr2MxT6Fa6iCf
	 weOAoa6C8vS1ErEnPiwPEk4lay937IprcVTPx956Y6hztQg08qwCIQLkl3ahjmtc74NiD
	 QlhPfKIYMbhvfMvxBdFm94pggiTzbdkf3BaRpQXT6bxeJcq21xY8RguOE2mvrW7Q0+Cdv
	 IB0tXpkRA6MCyDCGniMgnUSzRC6vMqTz/UfdWyBBAcvz3I530ttdIpAqr1ADUdK0y5Kqc
	 fxDg1aqWFIAfnk7OcqWVsw/UQD78GW7nB1xZQjkyPZQuNqZszECqZN5f7mv3Z+Fswbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794105388;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Mailer;
	bh=dcxb2OtDZ2muNlnYwXVmi2FrKAeiyS26nrso39IWX/w=;
	b=huWO+E+HzLb7/kilGUg7dcBo+YUEZ1i63+V2orVEz+Y4Ss8t3dQ0KaW48ukqNlCuiFEL
	 vV3PSjPLIrgX5FCgcCVowQ//34dZ2SOKwa1iGqEcHjjFSBsJ96JftQmeHquvNGmNpsFvl
	 UZZD3c1p3R0ZTP72U7ofhHnA9F08iV/4s/7L/Ftye/rS91TPdoefRemm/PFXvE3aSAL71
	 dLxyeyd0gvKOssyD5g9adHpmVH/D3xGLhrWC3PGVn6dHvY20Jf74swudS2iCfV3aUlCXh
	 DgsVL7T8MaOxxqHPafSllGsWauaEpKkgYfVlou2/N3He1gwU8m9QPuVCJW0Nrvw9RZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=bBXIheQH;
	arc=none smtp.remote-ip=34.2.64.18
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com [34.2.64.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8700E606A31C
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Nov 2026 02:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8700E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=bBXIheQH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794105386; bh=dcxb2OtDZ2muNlnYwXVmi2FrKAeiyS26nrso39IWX/w=; h=From:To:Cc:Subject:In-Reply-To:References:Date:From:Subject:Reply-To; b=bBXIheQHu0SvcMOSLTjw706BU7+KpQcDYr3MRp6pN7btbVd0IqAFOVc0hPUs7dKvIzLQy4/HnmOwNpghMoRP8e2bJRbE1etTC8NJUFe18ZlKk7ZSFggV5CP13kQH9W+8JjbztpI6pt8bo5YXHHD/MpmSMLm/+N8NiKocQOz7/ZZ83f+s+1/NqEW1HKWY++rWXNHR6MuAiLAk1D/wyIzmd1bpWInNliDgbbM7QCphUb0nIhMOGtolIoehrUsAj9qdv4Y6UMdaDSrG4qSW5/Lszh0EXlvlsONFnhmFEd/7fH+ileH3Q2HMw7wwCInE9eXLEnXCUVYfCw5tyEboyIi2zA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794105386; bh=NIKF3KvlpZRIvQ54dVaflu6TbBSVYybC9rBEarJRkmG=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=SbSedStOkcoVNC9/KjQQQmgyPa8ov1+ycYj67sZyzvSAleXbWMBIcYxQhboBEnCQ9ezOVJRmtoLVUi7XHjMOiB+udvALqdht9ScLiOH8vCnlmqXej9g3l1UAJ8bpc7lIl/Tth6YAVEWpXuq9mujKilOCmPKCrvDmc9Cm4KGybYDDqBQB5q3Gvr4/AeVoT491OLU2PVgs4KO3VyhqHP4RqK3Yk7FcKQVG+MCou3R5CPy+Qi6snC+wXbXzFQWffPDxG7YAtUDY5Myplcf5FzVPfxPekyJOVUa4gWyj+44DCwSuUzhxrqhIjgimIQ7JV7DPDgJs0XdMa3SotHokMdEadg==
X-YMail-OSG: 4aUzieAVM1mn1oUFG.qwRuh0GMKf0az9o_mr5O8MypTDB5rsKSa6KIR38SSMTSu
 7E6nYVBpsBuSKeCASftOq5saanr5xgS5Ss7g4XSfTvsftyJaLosvaxP9.xC_k_BEuVq55YB9wyrc
 9aOw_tNLcaxqjMggMNxcIugbKu3056r_oTs5tBsnyb1Al_.5X33Y8FQz3Ejr47b34s937_ezyqVZ
 LozEWxJeSWcHBE8Ijcxtoj28.qSsJMPKf7Wmxp33S945qrrSIRZ4OHxii8iOua8089l8fBjYuG.0
 DVGUD926X5ianJoA74AdiSe2g4ZMZ6eKnGRX3WyPmWLs7HVCm_ryqIyt5xVEZOIPSo7tk5sCFXN4
 Mpoyevq4YF3h6mwczfSsY8G6FShDrCIuUAf0O1_nwmQ5jxLNwxCvMxEfaCDZgHE_o3GkjRxncvAX
 yZpBoQ4VLraTScHhcitrTE2Q.AcfBnAS.uHUZsoX.Wvw2Bp2UWbrnx04Oj7RYy5_z0gHoacvA743
 8eVTqj1BdC8Nstb4D9gnO66WbXTcFEC7N54XTj2K517NpVDwJtYc.8yHUgJhF5Jh.Sq_JEOzFrnK
 EkhNJiAH2DqLbGLm4VtaXqINcOGz_WMbEPWChc8J151d3ZBUE2BbpHMB1PkfFGgn._Xb0VUhYSUF
 fvZMvEcrq3B3yhMucqbtz1FbvTdqHVHrOoQrG77cwjN1zzTQ.H0dmv.i8SudknB.4mAm6qfF0xX0
 CfnlJLAgQ7651Zye_7DCMs5ov_H.5KTalZ5dPgWEGBIdvTGlr4XxCIf9I2Dp60GuIaqSlhGGwL0j
 kAVqvsbJwuM.Zj97uh20ubDg9mIhKQUYgAEz_etZWDoj1Re6zlC4DezEue2mHI8wDYba4nrFoMqt
 9IG.60i3vOU0g34WNn73s4r3JppVap.BHrsGz9mSnBQsl31gT9yMYCgvbANCA5A3HKOZtLm9k_UI
 ALPx6VeYt7vEbaJvT7DA3beKIPilJQfBszB.FkuflUxhAUa_A2Z_HJsv81cDsGY2uzYs1QqJLmLs
 EqknLQwNcETWjS3M457lf3XZhOggQc7moxFh_9f0DpfEPLRC2ZqAslnLiyEEHJic4OzsrOm1dVos
 Uorhtnc2GmX3R1M7DvYaMOV.fNyoXdi2ftQjYkWtkjB4fZpbTQyD7xKEPzClbYYkysTZXcG1QL_T
 ujed0jj9Qgz7BfUlTCyZxywuvyvv_9OOym2GMl4nqBV9jiReCla759ZWmolJcn7AMraM3ombnZmO
 pKHLSQC89MHNJgXIYe8DiD9sM5ORJCBZFS45FpCkFJurM6vr6w0ic34L7qfu1ePnsqDtONYIAZJk
 ThbTQKsOL3w8.YN4ucgeUar3ysfyTq26qhWe7_LINtqCS6TBeZLG2UsPQ9ZxpDFhLcD2Sy3LagfP
 yf0b_IObFiZymHTDGJk3CvA0IMzq.eWGCYL9H6814YtNebLQLkg3ahAZHdWQ3krDOTTsPDk.79VR
 Y8qF_icglQxCLwqLBsBZWCt7zS9jdUWNYCmWnICW.7ESpbXQpiFlBi9aE5E2ku7Eb4WaTE2XdHkx
 OEr1fDMBNesmauavjvZIzZN0493HOnAU97u_PTW4Yb8mDHnwQz8eGOh_.GDouxwiqgKcJvibKiks
 Qq7WhN01vxi_czjMFjM493J4IGw16zqqOKx65SFg_sj.EQ1xE3nUEKxhG_8vqXx7tVg5lMAtIDzt
 8rNj4f4UnuNE5W9NDGzm1yb2HXVsxGBECi3uGSl8gGSQzTNQHqAWihiVWiqA8UfNC3PPzCmxypJn
 vR7Q6DUn4y6KEZtsG9NnwD3aPQzMEgfdHjG5CeRTp6acjUSXN6W3h3nxXPwYsHVnaH.bJGD6JdRE
 0thRYQNv0oDN1W_aeixoXdu9WT3R2VshYGnNYHmqESoZODGoEElCuNvrireePdSbq6NlAHn5VfKS
 _j4zFsWExFkoulRSwm45NwOwzDCSvGGuI0ZRiTf2hyeyA6PuyYP3LA9hXE.QsFo09n0VuWlWMcgM
 aXtJr7exM62dGLhpYr68-
X-Sonic-MF: <capitain_jack@yahoo.com>
X-Sonic-ID: d406044c-29f3-4bc3-8f6e-0bfb07efa539
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-104 with HTTP; Sun, 8 Nov 2026 02:36:26 +0000
Received: from dip61.lsn.bf1.yahoo.com ([67.195.177.70])
          by hello (SMTP) with SMTP ID 76980b0d153db45702007aab87c25563;
          Sun, 08 Nov 2026 02:36:24 +0000 (UTC)
From: Daniel Campos Ramos <capitain_jack@yahoo.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
In-Reply-To: <179252139906.1666014.10596432029920554734@yahoo.com>
References: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
 <179252139906.1666014.10596432029920554734@yahoo.com>
Date: Sat, 07 Nov 2026 23:36:21 -0300
Message-ID: <179410538124.1716246.9582944258691673781@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Mailer: WebService/1.1.26943 mail.core.serving.mcws.prd.acl:role.token.mcws.jsmtp.yahoo

Hi Lorenzo, Linus,

A follow-up to my 20 October note, with controlled numbers.

The principle is the compiler's, applied to comments: prepare once what the machine reads, and keep what people read beside it.
The web already does this: minifiers remove 48 to 70% of JavaScript bytes in one study, and source maps lead back to the original.
Debian does it for binaries: stripped in the package, debug symbols in -dbgsym.
Lean Code does it for the text a system reads: headers, scripts, settings.

Every changed file has three forms:
1. The authored source, unchanged, in the source package.
2. The machine form, installed: comment-only lines removed; blank lines, directives and code untouched.
3. The human form, the complete authored text, in a <package>-lc-hr companion at the same version.
The human form costs nothing at build or run time, so documentation can grow there, better grounded, paid for once by the person who reads it.
Line numbers shift on purpose; a tool finds a machine-form line by its content in the authored source (dpkg-stereo --resolve PATH:LINE).
An earlier form inserted #line directives: it cost about 21% more preprocessing and silently disabled -Wmisleading-indentation. It is gone.

Measured, per file type (instructions with perf):
- Kernel headers, linux-headers 7.3.1, 50.7 to 46.9 MB (-7.5%): preprocessing -0.78%, compiling -0.52%.
- libstdc++, 864 headers (-23.6% bytes): preprocessing -2.7 to -3.0% instructions and -3.9 to -4.3% cycles; -O2 objects byte-identical; one compile of bits/stdc++.h reads 1.9 MB less.

Measured, the whole system: a 2016 AMD A10 laptop, 28,500 installed files lean, then restored to the originals, then lean again:
- DKMS module builds against the kernel headers: 6 to 9% faster warm, 1 to 6% cold. That is more than the instruction counts, which points at reading and caching; the two are not separated yet.
- Programs use 3 to 6% less memory; boot time is unchanged; installed package files take 140 MB less disk.
- The cost: 0.4 to 0.8 s more per dpkg run for the integrity check (about 64 ms in the current version), and a full verification takes 22 s instead of 11.
- Modules built lean are identical to each other; against the original headers, modules whose macros carry header line numbers differ in those numbers only.

Scaled, as estimates rather than measurements; I found no reliable count of Linux machines, so per million, to multiply by any fleet:
- A developer building 1 hour a day against kernel headers saves 15 to 22 hours a year; per million such machines, 15 to 22 million hours.
- Per million machines: 140 TB less disk, and 3.8 TB less page cache where the kernel headers are kept.
- A desktop user who never compiles comes out about even.

For scale: GCC 16 builds the kernel about 2.6% slower than GCC 15 in one report; Ingo Molnar's first header attempts gave barely 4% before Fast Kernel Headers reached 50 to 80% with over 2,000 commits; your series reports allmodconfig up to 36% faster.
This stacks with all of them, with no source change.

I am not proposing anything for the kernel tree.
If a defconfig or allmodconfig comparison on the kernel's own include/, with the objects checked, would be useful, I can run it.
Methods and raw data:
https://github.com/Sparky-OS/sparky-stereo-os/blob/main/docs/proofs/lean-code-a10-aba.md
https://github.com/Sparky-OS/sparky-stereo-os/blob/main/docs/proofs/lean-code-compile-cycles.md

Daniel Campos Ramos
