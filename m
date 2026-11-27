Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781618;
	b=N2NP7NcH5tDAVDm2tzyktfFVIEFP88RUVxKWznZLIUP8mnhEpb3O+JjFbUFkDE6ImlXw
	 kJDQ76V4ntFvaiU7c+62x3svRVeVBJhnLhW8aPiQCusiw9KogYQP2hK9SjJxCMs6Jem9J
	 BwEOCkZYrh/QjZwzafVcrOnDOwk0+IlbYkAokYTCy48k4WkkmMukprg753IzUO0RTgt46
	 dD5bueEMT1zYCWzBQhZi1JFUr8CSldupz6THiWP4cR8H6HDnmdWd41+8LbBUXCewi34Io
	 0D9F0m/+hW9tFMwa7nLi4vgHx7+KaGNxEyUMaZZGpJtDSgspRiBBxar+MOB++YHW8Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
	b=iexkzkcB/n/1ZxeLhCWoijVvjeHeyUWl7s69oex2XqA8n1h1ADYOK+Z3Miw8FZLUG3rP
	 Pfzv1wO5byW3YCkzYGfyZLg3y3dUtN8nrdCsjUJ2qU/XfMUXYcJ1eQS81UbSh59xoLLQu
	 6FyfHo4KFPWPiVzPXtq3pEQBhjkoM1zUPOrK9XL+BRWQwWDQGB3w5nxRwdiYPDbotYOKW
	 TYcIUTk2YP5zfbKXFkcr/f7TAuxiZ++jt7OSuR1p75a/p00cYolJjxTO7AgA+tVHqxtct
	 Q6k6R3H8J0ZrF0+s1f9tR7LyRgh7tU/pIivsD9RxA1S95hY8+HpUVb4UiOjIkhA+UBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IzTcYT/o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A64606A339
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 12:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A64606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzTcYT/o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKnZgQSD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApYGG2058109
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 12:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=; b=IzTcYT/ozKMWXuJA
	qR2A1WW6ceB8r0S5rRexOAaw82FLGR9RGJL2KY1QkdqwqhxOyy8+EAURlkYrhvmd
	bjyzWZqkIEJQRryUt/C0tMhcxF/TjRuJdu3CpvRmL4ecVAtogGaVmu8Jno+f6yXc
	1D35w2HDNHULZb9fFmkEdlU/ey5qoHhGXXWmQ84kKqoOrd/u+VgeVOdFTzXHvTTM
	5tuCqikXS5HG/dFoCJ7o/VM5gf2SqaMLM0AI/WEYe8yHvUDuthglQhyNU9alv+Iq
	oT5NKBdl9W3LAoL5GNm96tf2LSb2BO8r3kIpeCe8oXIZs8fLvunOWPA420dvhkbG
	A4NYzg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasc7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 12:13:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so348735e0c.2
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781616; x=1796386416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=cKnZgQSD8br2MGLHVo+K4h83QIzyW0OkHXK/IcSJtBaa5Z4bSkpAUCioYjn07Yia3Z
         BPNeKZJDUB3QQ54qdI3C4nbCyov8n7yKrhWA8wqB7eRRAjDOmL900FWP5dt6XywAOMPp
         fW3S3Pm3lytDYqjEXwbAT7u/0Zx5NiVMjSWQo90ZNjGWzKQX7dvrbZaKo2Q5x47hdxJH
         EvXtFF9XsS51AbB9tZpsW1YTOvWAkSQQhCpI2rdXp9E1NRCP/niQg2Hjtte0bpUenfW0
         lVnyK3G9GZzr4TSvo7hLrejlYMqJtKE1dSZ5M0MQYjllKypzkwx+qS+STFUSAiXbIeEg
         Ktng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781616; x=1796386416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQRN6hMLtXmRb2agbnnXvDMdlpvFKVesL+5VYB+4UJE=;
        b=adACxPwwaqdGh0r1DVya9CPgO7+99FT337fDZdOUuX7A6oU0zLdT45ySAbElQ2zSgH
         YCJTbwDp9GZo115G9JAFqm38IUhP2ap+c9q4CXUNdY8CxgFIIWoEYDYkc0M+enf0Q35f
         kjztL+wBs/AlJEyxNzMlRZhbUhHoDXK/R3HGYAJMw/JzjTSPZlH25kUwX30lVOeprQp/
         KSugLjI/mjK0dA2jDKCeCk40aM4KpItK4aET01oSpUnIStjJKnvGyqmxGPRxMYjyqXmc
         SnyiVCuJcGnU6fBDvsYHl0h0QJD4DtPLXrs2xjg56q1wk6C6f0z2ghhe54p8NFRLjzKr
         p97w==
X-Forwarded-Encrypted: i=1; AL+hErGDAfaGGLzBcYNZI+8vcuzJToHp1tTLZYRRCezVZVsyYF9IkiFcbtnGafjOik2QravWGTIWV6zxujDsJEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SdMrt8iC0oeqPEXBzZgiI8B1S2n8Guod3NtTJKVVgZmcVfwko
	rgcDYoIdkHLNcmAxoE+l7R7rqQf44BaZe7PHfoK6eU+d4CuiQo642b7R/e3We56V8/x6it+diyg
	1XEUxwD4LOCcfN9hRVSO2n67urr9Vrtmm0r1IyaI+YiPfsoJblkYmAn9heEb3pmiLolk=
X-Gm-Gg: AZFdTZcy4bFRuad6dhuJMioMdjPgKIrpzpN4UTYt9l4UekJOfiV3PjIeKQLmbPhTDKV
	xBMho345HayFeMgSraOr8FVGXAMfjCPFmZtm3jMeGrePuOLcDYlPee/6W3x4Qkd+rjWtyx+n8Nt
	ddrv9EMJJFwwgO7TLJZiLN5gIERSHcJUiS36+SnGknsuzt/2nV8AVPR9mrVo+hxZeXsoomtz+iJ
	uQMMA0oWik7lpQ54y2sOSsyVj7zx7RN3W9ue8cWjuW2jPDFGtnYj3Q32gagy8WvvUmIhfZRwfv/
	ZSMAUdhmr/lvdGsC1yp1cg6YckKYhiSDPEY/mNTHDaUWCCthuS706OIE795W8SvH5sqKfE3z6cY
	A017aEn2zpqRnGp6YBNDK9oD8UHHnQfqVRCU/RAbfIDI6w2d90DyUijawkfSSg9vvaTMI5P8=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376774e0c.3.1795781615898;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr16376707e0c.3.1795781615471;
        Fri, 27 Nov 2026 04:13:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm845002066b.43.2026.11.27.04.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:13:34 -0800 (PST)
Message-ID: <c3ebad86-3421-4941-bf64-e400dc8f14eb@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:13:32 +0100
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
Subject: Re: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add
 sc7180-trogdor.fitconfig FIT config file
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
        Peter Griffin <peter.griffin@linaro.org>, linux-kbuild@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
        Saravana Kannan <saravanak@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mUzhAdDQzSQaMkBKHjumTZIifErGkaKh
X-Proofpoint-GUID: mUzhAdDQzSQaMkBKHjumTZIifErGkaKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX5Hv3WB1x99zY
 T9ptZXm9EoCMq272jo9WUJC0b8o1LK9dXu1lRECEViAOoLUyi0V8gVDmRQf4J5g1z81tmAiEzCJ
 2bX9m6Y8/+0VrFCB6pvqVaEcbx2FtK+Oyx43P/mYmx0P+m17n1F0SJFpB3QrEOBU7h4yVEihq3s
 cP7bO9CQHRYodP2zZDmjOl70HIczCSBADySnVFj6WaQvKH5Fg63IUfMkFw1aVJF1Ynbfs1WOGkd
 TqG1zxeE/4/a39T0N3z+YW3kjC0+Js0vmvM63dOm7tXyUYonrR24OklSmrBvgBCDQ/SITxWAOTg
 VmaAUDO3YY6hXyen4X8hBByQeaY2ycqnnwPRQfDU/uKzoBv90Mm9RLetCxhfOuyZMnI4gKBdjZg
 aZ3EnxyZHX2i0hrW/ySamMYKPCxxuf/gBfkyo4vgziHrludonGB3NBxylRZ/EJ0du8Zhv6nM6nr
 zD4FIOPptN+NcS+TgjQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b0973f0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=kMGPIAtnrfzpPBabNyUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXzHROcsS3xM8X
 59OGyNqnSTAk8I19IPmvf4Nc3FIphK7u/4thECj5KbgfPpyC7ujOQ1hmOemM3UytPa3Frb5gJQv
 BW6EXUovPVXFFZMaO3z3jxy1+Ul4u8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/13/26 10:09 PM, Douglas Anderson wrote:
> Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
> SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
> FIT image to be built with:
> 
>   make \
>     FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
>     FIT_COMPRESSION=lz4 \
>     FIT_FACTOR_DTBS=1 \
>     image.fit
> 
> Having an in-tree `.fitconfig` configuration file for Trogdor produces a
> FIT image matching what downstream ChromeOS build scripts
> programmatically generate, makes it easy to use `fdtfactor` on the
> Trogdor kernel image, serves as a template for future Chromebooks (which
> could encode board/SKU matching metadata in configuration match subnodes
> rather than combinatorial `compatible` strings), and helps community
> users building upstream kernels for `sc7180-trogdor` devices.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
