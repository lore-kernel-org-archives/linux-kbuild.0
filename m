Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.64.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521430;
	b=I8LHaMV89fdFk6PmT8CJljRL6L3Y7FBwehX//VVrImgpsi43h08CH15UIHm+XMgRgeEM
	 DgW1a0NUBrRAReCKl2YnqrhVHrr3spT87CfEr2wzsXJzosLVKWQIXT78dK4jDEH01h9eS
	 XGq3hXIvuJQP5GUO+hvchxH0i0kC2xbpePFodMxs2qYec/lobk1vA8cx9Afvmq7pL/aVi
	 VH86ba2OsdPwBi9CsNcKrHofUjFOzVcM5VZ32zOiHirvNEDGrY6mmPjbOCfTO2vpN16qB
	 qURzt4zPePXyFCkpUsXX3sBJHR60ZenHnpZPKSRjS6Nkev2OQYHeTysZhXQuU/fc5Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521430;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Mailer;
	bh=uKjP4PhEv6h6oryOUkaipQ7zazivOxdCQR8xjjU99uA=;
	b=msMtAOr3QnFc4NXitm0KhRJ+4wBzUKNhbO0COyQvBzSj1ERmKazfhWxC84VQpntxAd8e
	 Gl8JgTfbQNOUk7tDJcpMR6cEO8U8/XIQZ4d3cabIfBttH3jI0wnn9P3pj8Q+QwJaj0/rK
	 EAJJsxQItYqGpsXwzZqcqlt+GO6Vz98AXBuoWj5WsAZy5Iwzd6s4j25ylOc+16CtwOIvK
	 rabvA1CTFOkM+S2PPyYbqlFSBM1+N/Zwqn2si/HPfFRudYujObxPO5O13QAh6P92jjHCk
	 ipKgD4gA+qcKzbtIhLCUmQOr0jYtGcckTQT4OybcmU0ywIm9uLtpZigUOZshief68Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ByuzWqlN;
	arc=none smtp.remote-ip=34.2.64.18
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com [34.2.64.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEE2606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 18:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEE2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ByuzWqlN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792521428; bh=uKjP4PhEv6h6oryOUkaipQ7zazivOxdCQR8xjjU99uA=; h=From:To:Cc:Subject:In-Reply-To:References:Date:From:Subject:Reply-To; b=ByuzWqlNLpdr1zZVVQ8kvVWDiY80UYgomU8KGPAKoXoI6MmdmjX/zp49+YO+nRrd3ipLE0jM0veVeqB2bkbX7iUVZ/XNfcQU4MDw3zgkwHUVbwgYdCp8ul5MddaLxtwIvgBYTkuG0QJa+0LAt1Rw6bnCV5wZb7+ZO+3ewVNZJ3AmasroOzCkakzahP0HOs9duV2fWmgEZPSK1Yl6ALxztRGTYmZogDfYVfD95LqQErHaQti+WLqpijIX77GjFcSQbmpMDa7Cuj+MNF15atYwZ+Kvt7/a+eLxMZPaY/Ojs/RyZnq4qGWNt7mBk18+i9d5oAR+uL8PGIeCmlTuwTkGTA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792521428; bh=VT1vJ2eTnBG62j+sXGyHHpF2FrfcuiSSmE375IoQ6JG=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BmLBupnD7akZTNXXM/b6GHt2JTeDy8B0COV5JzaF3U0cjMucTJoP/HT2KL+CRZoYuEArtPXrsCHhkfoABoYHDWZ+9LWu2NDhfcqfpzB2nq90A+ItqP92Q6AmOy3TBBMRlYG+12MgygGbYNWj/vCYSBBtcVUovulKir7C0gvxoGI8ycM/mTf43FOc0AuGrhNs5w8dwTrccAmw/p2wxqpiaXqUWEs/9vAwUcPyq9WuRd9jVLW5kxWPTJULgOgsaoAXXsN6uYf8PhrQdEPyM+mP5tZM/CCwQ8FjpxbshvTI1CSosaxQt/92jPRMSsjNz74QQpUipjxJsFrumANhpUr9SA==
X-YMail-OSG: tMmAiVQVM1nyWZpopzmNi.y0Q6ac7wMbUFCxl06PlbWehOboM4IIlcsHAtGwz9s
 nHOSqg9YEn7oS_pAAHuRIWoAiqNCzKP1nC8yz6EeH1dGQpi06pA0ZijTd2lu37bM1n6KB5awVKbR
 UJ_pnLhggR2l_Sleq_nfYYUIXRKeTMxVr7sKp3.iJIyPvDGtyA4MMifMx7XzhTeWYl0bhZmZP5KN
 HPig_kaXumm9APttv4kwJXvIK2w6w0GQ48ZdYCWhP6p9Ru1DSEVPOX2tsmiv7r4IeLCXtdpP68.4
 4ltHAy323cep6VDMgb2uyRfuze1XZhPlK8EKQa.iycFk2KMJY1.BhuUtbcOa0hvVoWVms8lmsQ6l
 dguoOlBSefL1vd6TlyNLrVqMzt51jd2MaBL_W2M3SgQRw8XQJyloBMWosWXFZES00UyPIukqhHdl
 SwBa6t9MIHfeL8JefFR7FkiBgh5oK5OnWsaAfFgP8.Yf8DbzJDHHIQauPDYNCPuLr0CKsPgImgq_
 yKTomPXucd1KH1YblXFupMp5huYcqA2GEXVdbUvF_ndo2QikUa309qhB.7fb3gMikWtVC5CUvXRk
 Fos4pLcvN3hOVauoi_Z6D_SKuUzc0RAsfzSfpFbV9jPhtcGm1Fz0DcjXYZZxfxlhxe6mepSLblNi
 p401sOSMxUn5kqXSCEoj_4hqviSKYW50JRQuSGB1YYT1UHx5YdvRCds1qx3lxXo9JeZfrctdoA3t
 jmL_ONsae3HH6aGH9WaPbj2WtTzD4ULu..1nqFXzmFa1KPA1OgB6mD5OIlR3VNKbZeAJ.2RWvDi4
 3oHnBNbBxrdNYf_OHW_TMJq4u7ykwNVxN9NISmpLzo.pB3NXc7xY_3BX6gLvn3wvMi8aTGCK3q.a
 0opsAWNJK3mICOpC5KAEzEexnVGV0s7IOwaHDND8PQZkR8RJWq6anARQ7mSfQNYM6q45zEVH1r4i
 _pdxHXmDuFlFwIJOiMR7lmTsWnzYLdyqihNBDTnkZbaW7dDj3gVkPWajKw_ZQur5nybmPMxuqa9u
 7NY9wAfJjdKpRS_SnBE.0J5cxNUIZ3SlcxAYvgmKLGGzBCsDvVkCQuoxuTfoyt3j4Uq7GYH0sMWp
 98bAAfCNKl8fcuZOSDZaEFZa4LBeh8jdNKjMXKoc6M8xxP3u1VZUBEtrlRXEYu4VSgi1N2FxDKbe
 W4_8DtgNdwJ5MkZ8NA2cYUBcwpq7hd3yUo2GhXk2YGpFB1CdJmO50ztm7pQ2NL3msB_gtMo80Ir0
 OJYmhJlkmsS.ha2b.1bHsYpz2ixAjnMTUbjyym.PXoFXiwUdXow6k4dZ1K5y2y1mh1grH3X4V04D
 6L6WFz5ReavSe0cyt0Id6vJz8Ql3cbKB7lOUdGVODyObMs_f7SjjgZPkE4un.RhOr6VFyPAiOggs
 eJtciAiST7ze.cJ3Md3gcucQO1Xs9CNSrNMNluBaSOJ74zRoID5YCCGjHsOR1RugTMalZVQREO9f
 AY8umjmNxGO7d_KPpMlfkna7MOS4djR1Zj12kuUPFvJmhObKAqvPrc1m7ngfJ5Ks7t0MShpxAsoO
 cxuH89zKXL7gtj4t4PpnZ_n5ZsLcGqIhG85roW2LFmyx2J7egMIlBAYOgsHAY4i_PGZyym89S8kW
 vKzgnCa4lugEMRKX.awRV4bwuSKZ8huBVUOz0c6.pvADYBcD2KrrfNGGx9YkzF7iGFYxD9aTQMuI
 mCAkxRSMgDbXtBwNUOlVBrg7PKHf5sYiXMhBiw6rYn7z9opdneTiY.DlekGsaXcRJ7v0gx871awh
 taLk37nRUWhp7GsHdhBXcMt6oJLfKWfiT946GBa1p5DZKtHqI5MWh9kPzYtx1w0fBYnsR7RPmWQG
 JeydFKoflxyF8VfiaTDqNfVxakZU0ZNoTbgYJdhwws3dv4PT1qz31it66td_As.E7miDkvijlwwV
 bV1GsPhI4pnmmgo09bLcOSi6H183ZgtpH6.UdOTFvKP8Bb33tXPAOuE9gWiXULn6lVTCWvM.ofHp
 nZKiTPf9HPz3PHBwXJbo-
X-Sonic-MF: <capitain_jack@yahoo.com>
X-Sonic-ID: 3dbfca32-40be-4856-8db1-d8e14c9724d4
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP; Tue, 20 Oct 2026 18:37:08 +0000
Received: from dip109.lsn.bf1.yahoo.com ([67.195.177.118])
          by hello (SMTP) with SMTP ID 1ef2aaac2e463c76687331ab09204a2e;
          Tue, 20 Oct 2026 18:37:06 +0000 (UTC)
From: Daniel Campos Ramos <capitain_jack@yahoo.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
In-Reply-To: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
References: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
Date: Tue, 20 Oct 2026 15:36:39 -0300
Message-ID: <179252139906.1666014.10596432029920554734@yahoo.com>
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
X-Mailer: WebService/1.1.26740 mail.core.serving.mcws.prd.acl:role.token.mcws.jsmtp.yahoo

Hi Lorenzo, Linus,

I maintain Sparky Stereo OS and have preliminary measurements of preparing reduced compiler inputs ahead of consumption.
Our Lean Code pipeline retains the complete authored source and generates a representation with removable comments eliminated, preserving required directives and source locations.
The aim is fewer bytes for repeated consumers to read and scan.

On an AMD A10-9600P laptop with 12 GB RAM and SATA SSD storage, our 17 October header experiment changed 6,290 files out of 10,352 examined.
The changed subset went from 61,154,706 to 44,167,571 bytes: 16,987,135 fewer bytes (27.8%).
Preparing it with two workers took 258.94 seconds.
These are file-size figures, not measured disk reads.

Using the prepared headers, the elapsed-time medians were:

                             pairs   authored     lean
Qt umbrella, syntax only       20    9,284.25 ms  9,259.50 ms
Qt umbrella, -O2 -g            20   10,970.60 ms 11,046.45 ms
Qt umbrella, preprocessing     20      882.45 ms    890.25 ms
acpi_call module, -j1          10    4,672.95 ms  4,677.45 ms
v4l2loopback module, -j1       10    6,572.40 ms  6,541.05 ms

All builds exited successfully, but these measurements do not establish a compilation speedup.
The experiment used engine 0.1.2, always ran authored before lean within each pair, and used different header paths; it does not establish binary equivalence either.
We have not measured full-kernel builds.
Any benefit from reuse must also repay the preparation and verification cost.

Separately, with engine 0.1.3 on the same laptop, eight paired application-start rounds with variant order reversed each round gave these median paired window-time changes:

                    cold       warm      cold pairs faster
plasmashell        -159.9 ms   +43.8 ms       7/8
Dolphin             -66.7 ms    -6.9 ms       5/8
Discover            -70.6 ms    -1.4 ms       6/8
System Settings     -38.1 ms   -41.9 ms       4/8

Those used 95 selected runtime text files in a nested headless environment.
CPU temperatures ranged from 63 to 91 degrees C, so these are preliminary observations, not evidence of a general speedup or a kernel-build result.

The policy and implementation are public:
Policy: https://github.com/danielcamposramos/driver_stereodisplay/blob/main/sparky-os/LEAN-CODE-POLICY.md
Implementation: https://github.com/danielcamposramos/driver_stereodisplay/tree/main/sparky-os/lean

Would a controlled kernel-build comparison, including preparation cost and repeated-use break-even, be useful to this discussion?
I can provide the raw records behind these preliminary numbers.

I develop this with Claude and Codex as AI partners and take responsibility for this report.

Daniel Campos Ramos
