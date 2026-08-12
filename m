Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04E23DD51C
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523599; cv=none; b=XJqk/ea0otoG7OhLZeoYcF0Pk4gejmuCb6cITnSZ+xtaeoi1FKR+SQzFix908nOxLFqLY4bH84HIltG/Ej5B0WRxhP8VU52clq/YBz1kI6p9fBuYKzBxpETta6QEgWtoYwXP6KKf+lkTijisWwR2R8hSG2YwkDrwkFdmSdVsItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523599; c=relaxed/simple;
	bh=AfnvPvByM7NhMG46kRUkDxivAFcGgmGj9xeqW0owLps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDj8BTckoEHCDMGLEdPCQnWc2NyfLn+jnnhcBqONOIX7cUcC7c2/cmZJDjG72/K1RDtM3qsccLbAUTJ4CXO44Igh5Y+91zaPXHiFCnvXcTQ/9gil4dvV7cVilDZKRAUO1tBMWE/QAm+Zddz7Y9TliV1IKDNXp7v0OeGikzoZSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMi+xbV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGye7pGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMi+xbV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGye7pGk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62ZFT2948780
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 08:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=; b=CMi+xbV8rlZ997l6
	8ymfyCRnjTVDNYMTFbQHDvUOjeReWM0cMy1Nw29jxh6/EDU8FzIYaqrlwgV6Dugn
	Th7xAreT9RbRpZiaZNk+Ysied6XpVbJFURZv2SgQTM/+JG5tUZWc3Lr/c4Vf7A5d
	l6jMNpk5fMu0/wKwGbZkUeDeUixWNfMRkRazXLD0J8FxCUGrAjjVIhnO7GBU5dQD
	bvumQhfhc1mO+doLBf+WbbcnepCS6H5Ic6uwaJaHFNlixse9tH3RAXjawBbJR5fQ
	hO6a5Chx7vTh8a3CJdlOdTlrQnchK70Mpj7t7/gHEA8jL3rmO0tDthA+ANAZEa6T
	OdEjbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2rxk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 08:33:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so11677071cf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523596; x=1787128396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=gGye7pGk/uSd/fTCybtmLPEIQ4Njj5JUVw5hzOu//ZxoMLTaslt6r3EpfAeKrk7TSQ
         QvsHR6jrJYE4P/nTcBjddr5Zh4C1cyfe2rYvQiCE3VhotXQEoE2GQvFDOcK/0PvitBkr
         Z8cIUDiKa4hNjAWu+zFJHRHQifzvelnOeTrBK5zwcziBvXB/hJ1VigzoMHfwrWOQMoo3
         WqNkM1hW2ZzK/9Jk8xvYfN9+0o5zr0tVn7ABz+RoNMd+D+KTmXm6m1WkPdSCmAnglE5P
         WcNEshf0h/tp5WpYlg81kISjvUaOb5XUuczMXEk56THuO4JPp4UWUkazq+GoeuIQ10Gj
         451A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523596; x=1787128396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=s7QHg7bHsMh7m9crr0tdpP+31qJtCn5aZdIqCuyO81A+qQkS/QKPZ87L4FBiGwW6hy
         z9UeA2ohJns8KEMzNr+vQ5KBXbIkIKGWrrvx5o3dyqSZWqPYCqklB7Ydc8V6A1t5VVWo
         9HSdTt/lOGRqsvmX+7OI1+dRYLyOCymeX8BPedMsLPVB5IckW26tgjNqFXeGTunNNjQz
         VTkBNNd6Pg7v7pOL0oCyuAPnMC2o0XxK5OvpE+I4poGY6q3de9JzQfH7zdvRfdfE7Vpl
         BdMuP3OQTiohCRIORjIWgnu6v+B2ZxUtz63TvGt6fYxAyS8xnOepvOwsOTDsG7UdYdTa
         eiEw==
X-Forwarded-Encrypted: i=1; AHgh+RrDXtA2fH41x9FcRTf6uGLFuYy5VoGA8jeN4h+PyZn/MKai3AS5pkyTHAHvR5XUGI576DHFhp7IzL3aZuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8PxFiS/wxsRuAf2qcgKUOOYZEA2FkncOGgk7yOOkTB1Busc/
	Km1DrqF8NzL3wYZ3h/Zl6UO7nDxf+gtelRZyjbvIE58HrXrnyiFSBdqRLT2ZRDb7aoaFTNxAhKp
	mEqYnpATJ4RvrXGnEkYBlA00LeRW98Fv2xtyslzlFlDHDPP+P7iuVFqXniCnAunNxNkY=
X-Gm-Gg: AR+sD11K46jUchj8k+Y4Jn+gq/srjnwu2qBcXuUS4fuQBRPBIwBIVCzEtC7f55QZaT1
	ktGKyLW1/asLwLVdU61h5Mq+8bBu0FVxK+8Ts4lE+y7PpptD+de+c1uXa66E4/QBiFsYuoQxOhp
	CncFfBXEPc4Xd+D5NxCRsjoqsav9M/wLezoaJWA+nkiw0zX3GyPq/A4adeAfu6w1Z30CVd30r7l
	LYcgTTmbKu+A6Nw0RZWz1aOuHj5WLKgAfl3Bo+MypOfARSfnWxGI9KDElOwLxmAhasRT1PQeL7C
	43ytc+xvN8vR6ogl3iLMpuU9ClKe8fKbvffC5dLC0tZDTBc+j3wSnIjM77VDsmXTMMR5+pFwqRG
	INcTjDpDddB3bSW3jM2T2wpcNyjDj2YulYPWM5I2xZRaLihRyjcQ5vh2VtxygJB4=
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115411cf.38.1786523596203;
        Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115061cf.38.1786523595799;
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c998f27sm28031395e9.15.2026.08.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Message-ID: <16d3f0b9-2a12-42d0-93b6-b9da3f540256@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c2fcc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3BCx3Cm9m1i_aE6vTNYBLDGaE0IkqYyJ
X-Proofpoint-GUID: 3BCx3Cm9m1i_aE6vTNYBLDGaE0IkqYyJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX4hnoWS8Fj0yt
 87Biq3QgOJNFp3GTpe9sOhg1qGi8E+zYH3Ty6pFNoVz4zAJ8g8vnpFKDwLzwki5o9Vx1cJUjR87
 D7INE5MA6a0GU1Uy5LrM8YC9U+D6I1w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX12SfzZrmq29O
 xcYAE9C+CiGX/4MA9cT4UyMGZ96cZlkToq9aP09Q7Ekxa/MdqgViVZUVQfHnsxPCdcK6BknYrby
 poGJ8WW5rz4PCHfezpfTK1Y+OXi39IHOMg0BHnpf7ExcOYhZRQXn29geoei8wl9nAbOZq2s6BY9
 7drYMC2qkEEq2Ge3hYcG0sQcWFaI1AtPK8Ea9z6UKxl6l07YTNMZkAM5IbEZMOPlemdGazxkJwQ
 4RjgvIUbg4FzvHEKiJxMub2iwzv8K6LQ3C1JQa9tMhcABsqqhEjlnnRLW6GBIiXr07Q+MTxbXXO
 FBOkuBYjUMB9xh8O2nHgP5u2mG+rk1//+oaCRhaPqU2cWukQ0W7vhbvxQgDIvrH/nH/05dEKlEF
 8evxFEeykw6/5y28M83nbeB+ITMDf8P5G8RcxhAc68P1w8JRSWvPdOd36mn/WHgCFdZyaMmgXva
 bAxAzc9+dE4YUm1lg+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
> even if no vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

