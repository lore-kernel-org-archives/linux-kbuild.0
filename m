Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901433;
	b=tQSibDg4Y+8vUiKUN0opYgA9/uWdJhSa7Nc+kO7iw2bxHWNX7rednqCjEMLd4VZSnzY0
	 1/ROpy3g4XKFKDFYbk2JuFpzBO+3uqwtmTJ0o71zwMhMkWoBG3LYZT2OgHkdJWYtmkwSg
	 usCIru6tft03Y/AuTVF+OO6823yf6r8GYm2PW6kywTbS41pvHxS+YjDVScUyejh948Rn8
	 gWvMIyFytCsRWfBG5uOIUn+v/nVV2N7gtG9RFKkU1N0jyPxncT1bC+UzGmL3HRUqXdkS2
	 pzl2xU8SDWDCd3qKrIpHleK+yh7q0jxsfGLtapwrZZPB4ksvhKfDtApvuWP/cj4njrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1miHHjHzX+PzIvHEGZ5sEbAebfzqkab44G9tf/WJJPk=;
	b=MSGH2vk4i31nzMEBdxu0Z5HEJTFvKa1G+lb8RpguEzOvgibNijpxbFrdZCPPaOmtllp+
	 Xg0hOdWj7iJZRaA42iOpWN7UTboZCjIZu9YUrOPyhpL9YvZ66gKofziyESUEJmUm9vouk
	 xVrMjfePeueqe9qdl67zPbcYKsfu+Qg7AuaOG7ij+hVBVqpFFY8C0aNS7/yyrQmxSz2el
	 3fp+DB8Ng4Dw1U9vvUXWS4cVqtwMxTkHCI21TlrG/Tn3bB2o80BmB+D3XfCs+kTd4JEiC
	 AlByeuBxrpAxjFqfyjaVAH2lzL5YoZBpumTUBANn9epxZDQw2JiWm+bldodaQrQNwcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8sEM9N7;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6F606A31B;
	Thu,  5 Nov 2026 17:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C6F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8sEM9N7
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hi5gq2578573;
	Thu, 5 Nov 2026 17:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1miHHj
	HzX+PzIvHEGZ5sEbAebfzqkab44G9tf/WJJPk=; b=Y8sEM9N7vKdTj6HjUdcTCE
	lDre9uofWsAQ7o7uy5AJHZSLEV1PIL00IQugh9KRKMlY62hbMijXhrXSjyO+ed+c
	J/2Rie84cN6rU96v90RO1WZw5PsqWTupgTAezHl7czmZ7p4qlIEn/dLIUIzZhEM+
	KsFSNHeh5lGVSkhAzE192O+EKw9/Kjohw1sKpMRHU1UziEkIUwSyewANcWmc295D
	/3LtCCmCiu6Q43qLmSna0RhHXzv9Ctj56euvM1JN1GRd70nbtTzOlwHu9hqX6fUN
	xZqI55WsjzQkZPe/i85EQayFpfOQ3fRUkbcdlFfwItk0DKJpce97wCaJq7duqHeQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn80t48tf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:56:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hnv1m1992972;
	Thu, 5 Nov 2026 17:56:27 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hrk9mkjtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:56:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A5HuRYe55116032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Nov 2026 17:56:27 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B19158056;
	Thu,  5 Nov 2026 17:56:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 351EC58052;
	Thu,  5 Nov 2026 17:56:23 +0000 (GMT)
Received: from [9.68.10.150] (unknown [9.68.10.150])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Nov 2026 17:56:23 +0000 (GMT)
Message-ID: <dd2b2658-cb4a-4ba9-b69c-470d433a0ef5@linux.ibm.com>
Date: Thu, 5 Nov 2026 18:56:10 +0100
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
Subject: Re: [PATCH v2 19/20] gcov: add MC/DC condition coverage support
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
        Chuck Wolber <chuck@wolber.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dmitry Vyukov <dvyukov@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
        linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org,
        llvm@lists.linux.dev, Marco Elver <elver@google.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@kernel.org>,
        x86@kernel.org
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-20-sashal@kernel.org>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261103015238.3780910-20-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: cwJQeRxNyTX6GxuOPvxXzzLS9v8CaHuu
X-Proofpoint-ORIG-GUID: GbsN-ftVfGBhsujieJJUbKTF56leZQN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX1gk+JYltK+M8
 DygLW0mOD+DQkRT3cIKfLw6/lmf+c0JpeETlNklR/Yk+/kcILG5PekV1j9GPGRDxjIQsLmTTAZQ
 6613WDfbIwSuV6Eim+g+LaCsURCYBJ2OFhcqRtEqU5Dqn6x6MmZpAB0Lyr8esHZN+XMTxEtZgw9
 exf1KMFPDDcmcgQ1xCdwtaEA80GXLLktS/sMMckHqhlBfxTUE0a5GZYpyov7AsmXAXGoN13qxPD
 7dIl3heqFc2bByOrsP+JU0Hr8p/99ddhdVFFGWls7H+vkWlCoxn4fX619ZnSoufkajtikhHBllR
 69XpH/7s4tvQsNN27DkG0U3ttWkxL/scslzXxAea2KrkiE3x5IJzU6+Ubl9ssLYCYVjePTCVgLz
 tIiIuLiBlt0wkLI0WOe6oogHb29/uEWyQgQZTEfZFTvMEVeZsKf3G17pq49cxYDSdQeW3+1ZLjp
 S8JDGPgQR+r17YF2TZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX1ozUU4RVvpGI
 6Lth9lZO3YH9esa47BEBKiHNcBs/H+CcZ91iuk0wP/tbXrw1UaZnFs3Wz0tvuxx0mMXhY2fE8Hl
 1ltlXCDND+afsZYAasLP12+56MDzI4E=
X-Authority-Analysis: v=2.4 cv=FIqOVOos c=1 sm=1 tr=0 ts=6aecc34c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=95rrPwSdFze6aSbNxQIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050070

On 03.11.2026 02:52, Sasha Levin wrote:
> Support CONFIG_COVERAGE_MCDC with gcov, using GCC's MC/DC condition
> coverage instrumentation (-fcondition-coverage), which is available
> since GCC 14. The data is shown by "gcov --conditions".
> 
> Add -fcondition-coverage to the gcov compiler flags when enabled, and
> disable the warnings about decisions it leaves out, as is done for
> Clang. Both are gated on the config option to avoid Clang warnings
> about unknown options.
> 
> Also add -fcondition-coverage to CFLAGS_REMOVE in the x86 UML vDSO
> Makefile to prevent instrumentation of userspace vDSO code.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Looks good, minor comment below.

Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>

[...]

> @@ -108,8 +108,8 @@ config COVERAGE_PROFILE_ALL
>  
>  config COVERAGE_MCDC
>  	bool "Measure modified condition/decision coverage (MC/DC)"
> -	depends on LLVM_COV_KERNEL
> -	depends on CLANG_VERSION >= 220000 || !WERROR
> +	depends on LLVM_COV_KERNEL || (GCOV_KERNEL && CC_HAS_CONDITION_COVERAGE)
> +	depends on !LLVM_COV_KERNEL || CLANG_VERSION >= 220000 || !WERROR

Would it make sense to transform this for readability, i.e.

depends on !(LLVM_COV_KERNEL && CLANG_VERSION < 220000 && WERROR)


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D
