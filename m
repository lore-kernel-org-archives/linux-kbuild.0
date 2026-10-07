Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835F3F412C
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Oct 2026 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791351914; cv=none; b=NuYoEEPgcJfvi1uNWWjVCsHsU6Sy4ctr4cNlA9nIkRTQXqIRjSnY0kO1WPdEcdBzO67a7n6vC7mm2eMI665vEqFiCZnhE2dXcUQ1al4NERBn20YoevMLOqJGOpgCcGcei3uPez7fW+qrn7qw+u+SvOGP9AmIi5hK1yAdFRS5gNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791351914; c=relaxed/simple;
	bh=JLdo7Yo0aGHzWO8jQOXGTTxFo3HNKmLKYPEip9jRzkE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PJfFCCtr6e0rKBOeHwU4xY2Ha6Sohg95ox4zepUGmUfPsRZGtxhmOYa//lladp6eOgTDI9685H3mDrOa8AhCQiZLQi46dRCX/0QV8hvIUUtksulfDaoazTN9TG1uC8Fq9NziwEKQ/exi7KZJ9kSed8uXOCVJNNRLXByl0BKR0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMOyvwpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GH3qz/V2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMOyvwpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GH3qz/V2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U9wa3263996
	for <linux-kbuild@vger.kernel.org>; Wed, 7 Oct 2026 05:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMvfADnLE1w0cbXBCigPaWAUjGtAzmg4aDHoCod4irs=; b=gMOyvwpVNn87G9yS
	eUfE75xpT8rlIkvG1zto7EsbbYW59OAK6BTHfiliBVXeCjSsExPjtK5Xz+BatgdK
	j0VZhd+O1Z0yTuGN1rqnp9pCZ/7R1tH94rBCg3SRCIha+5R8KHI/GrZLd+S628zm
	pBhTGU6tizC1PZ/rj2kzNA/rXpeJ9g90ibj/e+lu8AO0BzstMHIdo7ojTdTMIVFS
	eik8hbmSkHDm1iAEz6a99NC5GwlurSmC9AXnGdVB89mz/UPUWF46XjSH6iRzAJ+I
	55W89Y3uZAfSCZkHOH5CdEkiyaue100y/syWlyPsd1zjQuddufqjNPBj3mGKiTpI
	TKkwVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c608r4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Wed, 07 Oct 2026 05:45:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso584596885a.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Oct 2026 22:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791351911; x=1791956711; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mMvfADnLE1w0cbXBCigPaWAUjGtAzmg4aDHoCod4irs=;
        b=GH3qz/V2qshgHQzpOerqgD8+fNzEquHP3ewwvTJynH6AOpudDsuz/6RS+CWVj0ESMh
         x79OMBg0OVc9bMO8u21Zfh2SK4ArBzfO3ExAvAsGeQRPiU4YYlnuXmtEPuoYHgUBnDwJ
         J6ed1zrbUeTcRbRBafYlicM5uwNvWNwV/9J3fRfPsDnUl0AvuTQ/LiPlP2nr9U7/fcyc
         pdKt/FB68/uwHVlpmYE5TUxT8OfddTJdZ9tS/Ggwt2821OOnxUGtFKgHYV7Zan4LAQQk
         yQB4nljiIhhPB6QNHV53wLBysElzk83ju2/MuANKoDMcVM+PmPSr9768PXMCcntxArvy
         KU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791351911; x=1791956711;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMvfADnLE1w0cbXBCigPaWAUjGtAzmg4aDHoCod4irs=;
        b=1w7ldP0jkO7++vjO8YUe71rMPEhJfHItbGstGb90Mls7c0PXplgKjStCdcXpnQgQho
         wwlH/VDk+bw4DWcA7+tkm26j7cq/Ki04vQAPn1Gva8vnYebWXw31L/g4X8HLaOrLoRhD
         IwELPXvIqd8/FBAQsjyJseggnnpMOP9Np7wOiyWwfm+yQNdGsSsVMH2Znwdlv5uVDTtW
         iOgabDUYj4o8ZczoV/1Hkk2XFvVlZ9S1e3rHjVvpPeE3ZM5obht3kYJSY2M3lDOyaYs5
         FsN63ib0+I+4+gni4B70d04YhDc0hYYJXVWrtilMjtT56XyDP40rE3hOSIg0ifyFScue
         YMsg==
X-Forwarded-Encrypted: i=1; AKwUvBxrO9uEREcXgZd6CGww55mabyQwyWNCsTU+xRmBFIBQIXoOSRpPXru9/uxJNPFIolYA+wjMIl4brxki1ws=@vger.kernel.org
X-Gm-Message-State: AFuF++m46SmVjQF7O1CKtX+8Yh6uBjpddTOGnSEjIzzrXEFxY00Tnqlr
	PmV5qfVgnas/3ua9I4i0+Da56M/MM5kmYL7b4/m0HiTXB01Hifpb2Go1VYiV91rg+ckrEIqRUkx
	Igljvij9mp4LRE2PXErahkL8Fwjm14Fm3grn0VzDeORTkIQZE8x72el9tI4/WC5STaRY=
X-Gm-Gg: AYBFou0t8CcR5IyrTriahwOCKKxMtwTsf2WBDt39M/4Gok6/uLazgn7S32Stbh/RWmw
	mZbPefFYrjgvZKa7p1kWaO2y8jmuQl+sYePwMruaQopahGNb/Paa1OjbVTF4IiF0HmLT2d0yoSi
	S1+XSgf1nwyj0X3tftR7lP5u0RlJCmzvSJWM1I3jIbg+yHKpVYiEcnFagBgJw00HQ4xjrPRlyov
	bYJaUUTCX0uU1D+R5mQphb0hBYy/zSmmKqCRYLuJ1PiY0tSwVvx1VeqcZiQ7X+6SsWCKQTDG+2h
	zROCAiNENeAjXYhad4+vgWsDg7YzQv7a7V6NvPJCm5Sfw/fiYXLFcijpu/38/E7uPUWHRvVw0gY
	oU4Z3nt85H6udLVAHYt73E+lU59ZC2mWDGUUpnmgliaAwmI4/ptjXXW0CJZakuQ==
X-Received: by 2002:a05:620a:2988:b0:93e:980a:2ffc with SMTP id af79cd13be357-93e9b830fa6mr244452685a.80.1791351910939;
        Tue, 06 Oct 2026 22:45:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:93e:980a:2ffc with SMTP id af79cd13be357-93e9b830fa6mr244448685a.80.1791351910502;
        Tue, 06 Oct 2026 22:45:10 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:e5c9:901:c496:8838:86d0:bc8c? ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c4008esm115356995e9.6.2026.10.06.22.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:45:08 -0700 (PDT)
Message-ID: <f127139c87754b806d326186f90a07ddb3ff9c7a.camel@oss.qualcomm.com>
Subject: Re: [PATCH] kbuild: install-extmod-build: install
 kernel/kallsyms_internal.h
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Denis Benato <denis.benato@linux.dev>, linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org, nsc@kernel.org, thomas.weissschuh@linutronix.de,
        chewi@gentoo.org, abelvesa@kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 06:45:07 +0100
In-Reply-To: <20261005200123.146822-1-denis.benato@linux.dev>
References: <20261005200123.146822-1-denis.benato@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 4RQMldWfAMAJMq8SVLCPFLySusKDh8DN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyMiBTYWx0ZWRfXyB+BI22NCwv/
 TmBQCgxMczLa0Hn9ttVRYf2KqAb3AnMowRRgd6lc9QuDrZK5T76DDmWOyI4YfsLwvZzmx6qyGDU
 2dLnlWCnWP9jVmmanZkmp+sQgWfsdQc=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac5dc67 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=DS7L5C3jCFOg1gsKO-oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4RQMldWfAMAJMq8SVLCPFLySusKDh8DN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyMiBTYWx0ZWRfX5O0Sn0sgihAP
 zwARKSX89XVuw2v3aOrbq9HlPZlvLIG99KulNIu4FeFj0MzOxCp3gZC2k6VOhUFkwJF7dN0DPlt
 eUsLEKrE7DOmdJiBrXaYbExEiwCr3MWBbZW9lrM3kOU63ksWxaVkjPooycqiVVcsqDnSOjAVKza
 qLf89pLySxGLLWN/KMKQsfCFA8vgwl9XoTF9S6qKbbASqnq5qO2RXO985fUOx5DdOQ/oQ4fAlVZ
 Dc/2hXFhVqU77ugRlwhZlm/MhWmi7bR2xhGeMhsOhVlyHcCG5P+jPeVpNaHk2slRtan3ZP2ULe8
 bUEIhR1NCOTMIaaxYwIARjwbSYxOQVc5hrtpP83NHA2Z5knykPp0N9neRYNrq5TGTvU0e0GAbLT
 h8q2fqUFb3SDiTUwkhLH/TkhfLrIiwaIvIgLoBeqt7pg4lggv9JaGVinwOSojqhlzzI6g3NN+/r
 TkN6IKLEnZjEvFsNEhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070022

Hi Denis,

On Mon, 2026-10-05 at 20:01 +0000, Denis Benato wrote:
> The tree staged by install-extmod-build contains no kernel/ files, but
> since commit 4fafd1165b33 ("kallsyms: increase marker density to 16:1
> to accelerate lookups") scripts/kallsyms.c includes
> ../kernel/kallsyms_internal.h.
>=20
> install-extmod-build rebuilds the host programs inside the staged tree
> whenever CC differs from HOSTCC (cross builds, or a ccache-wrapped CC).
> scripts/kallsyms is hostprogs-always-y, so that rebuild fails with:
>=20
>   scripts/kallsyms.c:39:10: fatal error: '../kernel/kallsyms_internal.h' =
file not found
>      39 | #include "../kernel/kallsyms_internal.h"
>         |          ^~~~~~~
>=20
> Stage the header so the linux-headers-* and kernel-devel style packages
> can rebuild scripts/kallsyms.
>=20
> Fixes: 4fafd1165b33 ("kallsyms: increase marker density to 16:1 to accele=
rate lookups")
> Assisted-by: ZCode:glm-5.3
> Signed-off-by: Denis Benato <denis.benato@linux.dev>

I can confirm that this fixes the build failure introduced in "kallsyms:
increase marker density to 16:1 to accelerate lookups" when building
with CC !=3D HOSTCC.

Whether we should expose kallsyms_internal.h as part of the external
module build is a separate question, but your patch as posted does
resolve the issue I was seeing.

Please keep me in CC.

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>


Cheers!

Chris

> ---
>  scripts/package/install-extmod-build | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/scripts/package/install-extmod-build b/scripts/package/insta=
ll-extmod-build
> index f12e1ffe409eb..aad2cd59a37ba 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -20,6 +20,8 @@ mkdir -p "${destdir}"
>  (
>  	cd "${srctree}"
>  	echo Makefile
> +	# scripts/kallsyms.c includes this header
> +	echo kernel/kallsyms_internal.h
>  	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
>  	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d =
-print
>  	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
