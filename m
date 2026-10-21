Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569140;
	b=Px0Wvp4jjtx2SON02gzPnCU7zKIMkU/Jl8k0li/0fc3moQNxva39+gcuUbMwQAm5WdSJ
	 tR9Ym0CxPlaPR7MrklrGzNlgkvnOiM4fC6O67WmGAC6jZWklSpHfcnevp0pN0ajuqxqGA
	 FLxRviuENhrlzwNkuPas55DZhHwa09orTO7q2FoWjIdFwLfkYM9n7mAKE5WX4X8Zt9kuB
	 Whb5h2XOWKCCKliAp9RI9rfNgJ1wiqbmjjNvio0jekquCqntnfNXHn6Q6tK3+ukjCmQKO
	 Nsh8whwe6oWnKr7nDD/4tFO4lbaM6Amtm6JCk1wMDEVZQW6E3ZfG71vTe66izjQ1h3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
	b=DkVZOawc1fCNjROCXeUZ4IJV2kJQEPaDTBHHgZ2j8t9x/AbARA2ro/hRK2MNKaeH+yqc
	 5Bj08tEsuyCLDRNkV1s/+YGEGl1Y3qcknlftWyA9OWDO95bMAGa6TIcfTnH5LKi7KU5cr
	 bpQe4JuKm63TaYWVDwALzg04rMknI42LGYaX7ehb6UZluXBUGrNOHZHALQfS3dY9eANhp
	 QK4oKvxxg8tY3CPD6LHK5y5MXt4ceSqCRHP2Q7yEG28UVeQDG4mBaQCkh3btepOv3l5Kf
	 i7WpA8MgX4i2lhlBe3nldzNCyPikInINHUJY/omhtuqb9cFckZJjl4SKt9WzF4710UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kaaNZghx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76312606A31B
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 07:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76312606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kaaNZghx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0GW756368
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=; b=AyQbDhhIrkFWR6Vk
	Qi2NR9JA3Zl2CUV7EWDi6niUDRqZIXrxHan5CO5/E/BXU7ve/rdkbmA1nMYiorTj
	uUnreypvOJoV9NBh7qXqdcP2SpKXHgjoLhz89Rwh0hy6JheE85O54i4M3fuBy9+K
	GPoUifUKk6HR/ZvKSW5RdHvWNFEesfA+HyQp4k8orY6iqKF5XuUB1191IkbZE+8P
	plpke5EwWoQ+7NfxTqbvPFLeYU9SR35EZlpu5h8sxqbblJm3JCdRo8AnJX/ALU05
	F/8Y9yWbh3i75DhlSJm/79KrlTXj29up/7QkDqsFQj2p0RS5n2rG7kpyuT0V4JEd
	ihpS0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4tm3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so14025385a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569137; x=1793173937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=kaaNZghx1V1tDVFBtfbOHdOEr9Phizi5xlJ6ERiWDvDbI05JyEfD8rWGP5+yvkruew
         TlfhXByCfoj1YkiW/fDODftvPmJftZIjr7Iw46dmmKiZZnoy12TAeIbExF4QQEj/EMmR
         gBVn56zqc4I7isgfEVvKVzPVOPVeYOFh9QZzb1uf1zHmZ7QrFXBZ7w1lQLvXfozybWcZ
         HQSvEbwYmprFOVV6VFjgN/6MewUKUNYD4bNMRVF8lImECzYCCASqyvAMJ2MXd3qy2tbQ
         dfquvwSA8MVDVame3bezw0dSVPs2SYFy8qtYfhPrgCagyVqEna3l6E2NGwAfAE8yyKW5
         Em2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569137; x=1793173937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=Yugo/yyYZpRpO/1eTvXFNvr3HkROX+ciDSywPDkYLs0UJLXBbyk292FnCVzR11PxK+
         QtHMTsbeb+nkXnV3NoDVhlbDmYW/J56GS9Q3jnLSGBFuD9CT2lzoDqTDgJmaRgFfqLgH
         Y/XJiu1l+NQC+mrloDh0ySd8tVKuoRwTzfOLQ8tpu+56hoOiBcMOVI32FEyLjXB0qcwa
         p7tKsh2tsEb9bmMaSIDfOTeXruHm91zNBbFNMq9LL+h6UNl8sjjgJl7w4chy8+iYM/NF
         Josor+y9uKK2wqJKX8IDcr5yf99Rqzl/QdMJmeckHmPakI+M7nH46qR2gJYrMnJkbMC2
         ybkQ==
X-Gm-Message-State: AFq9FYJwGLlgmxjHNGEkrtt8sdSxQvc7VJAY0XR+fQT+sDd747GmO5Y+
	4J6op1g6dyPQntSB6Ejj+La1i6MrMxzjZv6zLfnLJhQXPTDQUOWBpHPDjm2GPugS2fMJGpK1U5E
	uQ+UKE3lAFjzO/v0LTjfKksW13Ly1LEDlcxX1fnASjrcm7gXYR1OHyjthw8sTkEbqp84=
X-Gm-Gg: AYBFou157nVjIyHGQQXwWFP/fZNbU16S4ws64vnKTIDW6k268mwsp/xgywdu2UggGZA
	EHZfTb54GIEFZgTJ+NXyIylvF39DKyLtj03YZ2clvEkAxwCFfumTX4Rco+UAON4uQ2g3UAnS9Lx
	3mX9/Y3UsHWi6eSsviOQ4d5yOQVZkkZG/hvQKrEoHLA5v9FVI0v5sOuLIGlOTlDC/kcsrlfT1pf
	yFuvRhQzTfhbLr5a3yu9gKsdGuPIfXmoc4VPkDcoUzFFFM7nyquP+mCEul0c6R8xetujTpvEeOw
	xMlxFwVM/BOYIBFWdUSjEtE3WAFyPAHetfBlYvkKUE2jwZ2koR8A6BVPbITGObEhM0LA2mLznaE
	B9EzRK0xwa3+XlcS/ZUhNbQ==
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23256141cf.1.1792569137637;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23255851cf.1.1792569137150;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm49878266b.78.2026.10.21.00.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:52:16 -0700 (PDT)
Message-ID: <08dea1cb-aaf2-4c62-ba9d-8bef2d6d44a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:52:10 +0200
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
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
        linux-arm-msm@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zcSUODSkkzhRuVt3VUFgpK6DiytV6mV6
X-Proofpoint-GUID: zcSUODSkkzhRuVt3VUFgpK6DiytV6mV6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX2lDx3a+KwgkN
 Q022sH8sYjvDZu62gYq+To8QXK5t2pkWItMnfKyox135ubFVhhZWTY35e6x+wpsk5aje3DYMCHo
 fAJb9h8UwhBIuXVqgUND3fAw//T/DHE=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad86f32 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=hCCUOKFY6uXp-TWS5dAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXyA/0rcZuSQ9C
 fMldcroN4Bm88+zuOFKMayHDa4mamiZOLkiGHnG6Q2ileg5zE3mKLSytauEDOr3ZO495a8Al5y2
 9SE54itaAUJ2G6d5YUD2ljxoEcIfcqfF6KonxfQQ0Q+c/lgIsp6xeVQPT17ffkvrupTV7za/RAQ
 M8hr6Hb942j+wyb+ku3Nmu81i0jAKe6ArVrcRC1LebCO6BNN6euuTd5s5EoDowrTw66BZ5/tpxa
 hrd4sVwwe1/e/mx1J9OFJevgh24A+W/krMEUw7/zo+c9PPz1pWHkIkxn3QjIgjM+mZktKjxu5pS
 P+HWo+6RseRaCFV1jElofARVS96G7Y+037qh23igkHnb5o4R+FtBCKquZEHfKV1FLXaZIQdpKwU
 JcQgspzZYzSVlSmnsq5q1czIQAtQyr7VumbdegXY+DPMm++G75VdaprmxOastcLJvatdg/J2T5H
 A2O5Y1PPIr4RGELFOZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 5:35 PM, Douglas Anderson wrote:
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:
> 
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
