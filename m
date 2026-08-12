Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276ED3E9F76
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523540; cv=none; b=SOMq19n4itqqdcNZSlsXS6MIwr56ioEilIMekyQj7H9uc7EezTcn0KTgkS8iRXdtbEE0xOfJ55ZYBK5W177u6a2M95O2IgoKjC12D2guSjXZNKT1I+JSqFVUqBKLXuW/5djPHrznbuRsNZG9yTuAqlJoVO6o1XIvD9h2P4kJkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523540; c=relaxed/simple;
	bh=A3S1d4xkoEt+tF6cKjXmjHZ/NIiDjyfZkhSRsMbL/Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYMGT0PeHUcCN0Atmk5UgZUK/bLzDOwOPcH57+aUGW74m1v0ixcRBQpSGh8CNA+/YlUkggELqyglhmf3ggahNP7QNBc+JRBm883NMmiSsWNL9G3OVI3blNy/WOG7fD5jdf7gxTWwKhtTmNDTjP/EKWbGiO47P+Xzqm0PQopsFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8C9Yqg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKCWcWoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8C9Yqg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKCWcWoI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62AI74090980
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=; b=b8C9Yqg8Zv7ud594
	nLhBjn3LD0R2IFoZBphwr8fNk+G3TqgTAuGQRrLfP3UKNc+w9ecbVuIvfdwhgDUx
	MskA2v+orWOZkzQQc5qbsAoL2X/1Ibgu17Rsz0bi7WmtOCjmGpoHHovoyRSvSfgt
	jTafQSFR/yRRt4vo9apKANAlKhmbFAiqH887KCdB6o9SoZf546OmI7m6fYiyPZ7a
	WFCs785nwPsjy22clIkMH1I7BhQxrJiWr554cT8F+65SPndBCqt7Pm1r4Vwg1hhN
	7Ok9ydvCxHueLfYe96jQOcXPNTpqbrv4HLjZXsYIp38gQ6bCWQ2W0o9Ba55y0NMc
	SmZw1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049bv9s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 08:32:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d28f8737eso14004871cf.2
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523536; x=1787128336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=XKCWcWoIWoUejmddKjrQnHFexvKnamaGLQsF6kCfiDcz2hBDQcVU8zhQu1CYEkKlRT
         ctT5DttlZJLH1T5JQsEFMJodzZhr0nRCfFIC0RUECNM3jTUS8vO92FISWtZJ04qlDH1x
         pXzZNa/AgU1HbsTkROpnjJObGmxzH5an8fAhqZSQNyNcRJq6PAGyY49Gj8MxoNIjJUzz
         pdUCPruUQ7rvlsdUceLnHnK+RcB/3SIqtPHFkyBjYvCit0d7+0FiUORxhfNFd4FKYM+0
         gk5W8iDglP7TolyEte7NBJCiJiLnhYD9bMjFVNf3pnJmPAOjU6FhpnTLoR3m8KXLmJSV
         O9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523536; x=1787128336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=bt7cD+nJv4IWEsXxIn9C1MdW7wVxMEYfQv8h1zIZlV8l4lcNI6ZvHfXGOxxcu6+UcX
         0qO36lA3Y2rblWxuubeBq2zdh1VjiO6YaXzPjzM2PFqmUwEIrg7jRJ1cqjQ9k8sYTI3f
         nmjFtaCbec6a2Su2EA3z7w1s7O6e0QIqR1fo+nnLdnasVLtdFvXpOcDjrI5Py+lGUV+o
         eX+i1jvCgm3pqfIghrLPKto9Sxth69D942hT5g/Y3Q9AhBft/dnMO1W5Qe5StnoUc0XD
         B8cj7994YNV9vZLLyARrXGjuA/hsmsy4eeZ+5Lj4Fmow0ckNwh0yQIfVKk9BehB+p5gU
         QiHA==
X-Forwarded-Encrypted: i=1; AHgh+Rox/EVC5uyCC5+J+TZU2EVctjRhCaTjcy/06qdpInMPuk4BAgknBVNgaBGZGzHcf0A8Lhb+KJw/YFWc4TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5lyjqAG7+li5iK+ohZoQDpgYae/l42lWfL7XHohmPwiuPYH/D
	lDVqo453EqgZWQcKzJ6RDlyBEqYe8vn8Tn2yIRSx4HaUui5rxrq8fjAKJzwCdRLCY+FiXslxQT7
	URKWhUiQldd4DTSj+W1bpFMlgJPCsMGXZdbauBizq1TVJM3UdDL8g+kNAzsMDFOhKZgM=
X-Gm-Gg: AR+sD10u29NAx8exKVG+gAxJU6ZdfRc0uovRp6ES1LwW+Fo/AQkd4tbefPfnBB4zfB1
	So9B4jNAWg7E6qtxY3n0mNedN6FxoOANa3YVEy6iGStNP12u00f6dWnE+u7hpC0ZOGWaEvyJJQ7
	F4dJG6yPTXfFeojvZkLAg+5rVC4FbQp7r6hbBa0e2jdEgg/a6UfLivhEQLOPX8g5QM4wY3A+n+i
	FYDiwrHmZWP6FsEn3aMWSesEL3nnh6r+1Bcwsq9Fcln94UA5U1H342LQYm3CrWMKY3C2dqBJRWQ
	S8pU70doTpTG6xRwN04mKLIOTFBNECZczd5d1r+3aHpY1MP1e0K0FbQoMAqswqjTXOkWqWwC2rh
	Qg15UczixweaxSLEQisKedD4lcSHce86MrMMfPWM8Gcy3A56z7ky3jNihZiUPx+w=
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847571cf.33.1786523536350;
        Wed, 12 Aug 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847101cf.33.1786523535827;
        Wed, 12 Aug 2026 01:32:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997d2e4ce5sm9693755e9.0.2026.08.12.01.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:14 -0700 (PDT)
Message-ID: <c70e9011-26e5-46b6-aa1f-c7f0c179611c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] clocksource/drivers/mips-gic-timer: Remove
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
 <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WtPBEpPxeKQ5a1nmuqb9UOCnnGrCVo0O
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7c2f91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dVVT6RvzqqZ4HvZtmZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: WtPBEpPxeKQ5a1nmuqb9UOCnnGrCVo0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX43rzj5L9zxme
 Ay1QL3jz90OehJoptXSWELqLrSwgTsd6jYeZ3JxarOiFAJViNlPhkQsi+wwHLAHL2OJBzreQSay
 Oj2XJw/AbCP1RFfvpOnCo+kzGXVCciVVRoU+gK6M4oahRvV6dWZFEEsYlcCXrP3SMJavirYQRwI
 thMyNWfnkN0CMoRa1wJrlFC0Tqb9n9Frv2rTm32zU3jxI1Vi2ta8p+vUc4ypxbj9C57W6xSTWoD
 jRAyATMZKix2qaH3y9J9uNUE/8Iflxi/4iPzsmGkPOXYm2y6DTmwkYxQ7fl/3KoBLjMh1Kzh6m4
 /YTgM9XDVL4P/TaSB5JgNB1Yu6or5wQKtWncQIXffvPpIPjmVgw4yvoSf5ft2qVYHMpcwljecQ4
 s52Wvox0Kuknc/9N12VHGBzHMwVayLua+CcONFx7iHvk1ruFnsBcbW+eAWudo804rFkKZkX8/o+
 c5G6BhA2DH0x7fJDnVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfXzQKWrJbfmlNL
 Vz50amvLevIMLN7ABcBGGqSG1ibmpb07Prq0MVoA5CuzauKOopupc455h7lAnjP3u3mhcv+azsj
 YsbpG5oc0jjcOCsPX1Opgvz+zoJ48JM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120067

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_GIC even if no
> vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

