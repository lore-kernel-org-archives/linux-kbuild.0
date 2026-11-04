Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781453;
	b=5VJkiqodA0q31VQML8KxoQQs+eybykwRMRWQq6+bYAuUhMKuAFmJ7dtkJOgqyLfLgSGO
	 6TFpZeXl+jLA0FZHJD1kLkruEY/5b2I2hUAo5gAYEcem5gDJm5X++Y3TidjELGCYbiMzj
	 uNnz7lPqghjkaqzEwa/qNW2JuMRjg5RHdX90Dgj629Q/t6jDkI9lJIzBUvfJH6SKNxV16
	 MD+YejmPQfZ6/z9cEppwwFPyXc2lSn1OcS92nvgLtV9jHJohhPAohBnWL5c5xZvinda5n
	 tINb8geEH9J4vzIJsZ1SjsCHAZGrqXwe4YeOrBVQzcT8rBGc/O7DJrtvQ+EUH7PJ2mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
	b=gVA+JQNmuuy4aMp99yzGkCCuK0UyCQggs+JpjCXE2l8qR4ivJtVy3WrhEQ4OIp4O7v3N
	 mXAlFXUIl1jxm5a8eS1VCVQ7Lhr1TRJAOvGfbv62WWMmQ+Ig9plje8pEMsBghD6wvXaQj
	 a2mojow+jT0hxe4nyjPVn/mm+xUtp9Is4e6CB6w4emefjBkXEdAtEUqioNKkV7T41Ida2
	 oe3dwSY3sUFQXJrQtQFTbVYAERBA5mTWRerUbuXaCqCfV8aLopz1IYm22wpZb2r3B7Z+n
	 N2vIlGaE5Ql3Vt/9Io1wOq+7WBocEBKdnRncd6Ov/+Dd4X4108DgIcLDd3UC8w5ukcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCB6606A32E
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 08:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCB6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KKqp918403
	for <linux-kbuild@vger.kernel.org>; Wed, 4 Nov 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=; b=ZklL7L7ZCWzQ2sZv
	tFpS+HVTme9ImWkasA4By92hM/ckOxk1UZQ8dB8KKqny2rV56YPm02nuXkapFpa0
	/93w5AX3YB6/kSHOCKGY5PMWQinMs4bkaFtqyLBeykadLqLEb+0GHIvAN4/XKl42
	7maxi98XZ4EyhRQc+FU78lpXJr//wyijsjg8MJ2trwdY8N9o3d5RJ8rKw/TUYhfN
	touLwV6tCFBe12u0myVNKQR2g1hIOMZBpyE5Jhu+leDxLqJSWcbAdFm6J4ihWtLx
	HZNV3xfDGU9p6alhIBG+iplWJVDNRx9hMh7P4NMH+uGiFC9OmsYdeEKEshaHsiR1
	+N0GzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg955u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 08:37:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5476f5bd009so1391491cf.3
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 00:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781451; x=1794386251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=SR0beHqpbclrsxfec93AMxzw9QKXVpjS1WpzP218AT5Xj97T0x+G+ypmj3Va7cZ1kf
         ZLgqtCK+apakHbojRjXVq2AdVQ2eZy7YnfL/XyyJQgEuFkAup5HZKe65T+KaGMi58ouo
         oOKVe0XBEKHuo27jOimkkcS8+vrv65ABsmRNyDDkKvbygb8MxlxCmm1viHvgIpu06TxX
         y7kvH0OjSsDp5pt9StUfaYprediGs5fDEwf/z1pXcr8wXRbKfAOrCMsjL7VkeDGaLKFg
         u78OhaU+74FfVgF90IIg7vwee8Eu5cKIx7yh8L+o3K6cTCktIvl/+/0c/YHa4cIJ2SV+
         K0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781451; x=1794386251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=IG/J2I7ZhUjswKJXSVU81LFKqVXg5NW7l66ay1xMy0OH9Tapz2LCz4unzC5RTe4MLn
         tIuGBDjHpJML5A5ejIkcyojRTdogaZ+cyS/x610oBOfegptbQEyFHpoWoWCLThaJFzAf
         YSVuodkBKuHLX0+kX1MpPPhFKewxVY8dxUwHBwUAorrNEBGd2Hel215Nibq9ussZ3tu0
         EeFW3qFEu6//7x48AWyhw6XMl5jaecchAm2S4T8HQGXWY8aGEvNP5Uw81eG/hL0uxN3u
         LAr4m1cYVUeDvbSKQsajpXE9WQPRlDvhn7QFbsEPyo13OlokCt9BqriLtPytehblKCh4
         e9QA==
X-Forwarded-Encrypted: i=1; AKwUvByEbrZz+uwBsY58sAy3jAu8Npy6KVvAe+IbTMnXkCD7bRSCIWFHN5smAo342VpoMl3wj+V213eAvlHZXwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gvrx8LJQiBQbMFq4TEl34l8ZjIuFLU5d2lTJo824b3VXt/UJP
	1+fxffS9C9o1boiyzHo47Le+y6HC7bpyWoOjuLVIHwHjvsAOPcAJGf4Hy71jKGutxcLyk+sojZs
	DkN4EOXio3Z4imitwyAMW+Q6dh5mgpVpPczHGbqKTYwv1qwQHIeVRMmv4HCY16lbB4T4=
X-Gm-Gg: AYBFou0XKD8DeVBwjXHK0+Qodkmz4/Wozd0qv0AOOF61A6t5V16aCzivzysHWGG2Hh1
	oAWKf4gXAL+nwiSN0mAAJ0Gn9QYg/iMAQ+bG9inbUJiODH2RpPHhqf1X7zsCWQ/+EeT+hP42t3T
	A5+hDcN3+4+IqQO0Oqfb6l8MvFDzLWAdD2mB1jGE854ut0Js1k6Ffv1BxD18T2mnUoeC8FtLjeu
	X44kr/EPfV2DvG88n910UYQjRv8YnJv/5vleuz4Lp3DvlTO28cfj0ZWX89KkvWnR9EID9mph+Kn
	GEdwhoOKksi2HWIYmElE1+wlTwD7spyOYcquGA/DdbhBG/DjA+ru24YwHjNqNgoTqajk/F/Vyg2
	FKxNWnjwURktuoblq9ZE5Z1ueTmzG2uDSY+WTEmR6+YmapG5GiWxL0kUXZqU0eUdGSKR1
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481151985a.0.1793781451257;
        Wed, 04 Nov 2026 00:37:31 -0800 (PST)
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481148285a.0.1793781450641;
        Wed, 04 Nov 2026 00:37:30 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm538339a12.5.2026.11.04.00.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:37:29 -0800 (PST)
Message-ID: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:37:27 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aursRfQRr0AOL1Oi@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaeecc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=iGHA9ds3AAAA:8 a=dNOK39mv2ItteVrz7R4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 2eD505vJ7VccuLujOw-0vxIOaf-r-8pt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX4gtgrR0+fwKM
 v7kGj+aOQ2/GjTnjvNsihbhm5OMWPMz9147cUW9P9dL3BxnFw+k+5b+044Gw6xUOpuvhhw5ZO1Y
 UH341fliArYLSzlB7yIR0n7QigyazMGEa2c9EBo8EzL6/VfVcPBvLfZXPOOrz7UMfI353XjYjy+
 at+9guPG/bmlbfKcC0+ZxCwB0iTQj05/41HVWw3g2sAesyPH3cWohHoxcLPdZfmuAc5VOSsMAU9
 SmDA+Z2zTFK7rg0gIh3/p7ySfpHWBMZNIQixD1K5C9nkCG/A3khcBKY5VgVjec+aAAU+/L6Kfbi
 WPLYl5j7FoKsztGiELTjPbdw1WzxYG34RmMfBsxfxKFXC+0u5NN4oKFcER95OFE40GiVAbQeFae
 VOGRJyBxLBt0ovrKIvgKsg0tystGH3G6ySXOVG/kOr8kNtih8QOBT9O21VgAd1paig0ILlqtf7i
 CpPX14kEN4lJQ5Zc5bg==
X-Proofpoint-GUID: 2eD505vJ7VccuLujOw-0vxIOaf-r-8pt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX7lSIQo61IVbo
 1suKCG0ZL+mKoY9Zsh9uYhay2AkPK00cPSNzjqXYXA6MRTR6bwRhlt3GWkzp/tkrSe0OSRz8W5w
 +ZxCAu8nuvp+98QKa82Q12WPkbR1pKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034

On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> yocto kernel maintainer Bruce)

[...]

> With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> in arm64 builds:
> 
> LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> 
> In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> get applied in the final .config etc and one of the checks is for dependency loops which now
> fails with 7.4-rc1, full log below[2].
> 
> To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> now can exists in the kernel tree.
> 
> Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> loop to and from LEDS_CLASS?

https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Konrad
