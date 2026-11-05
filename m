Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900244;
	b=SPfjKU5Q19LI2ina25Pth5ebBqpaO3n+kFc8tYg3sNecc9UZzFmoY+pca4P3sayheX0o
	 IzMMw7WJFV9LE3nbct2IL81Meya1CVNKF1smJ5ysa0k3FauRGwjR0Q9BxrAhXjAydywye
	 JA4dryGYxwaD62m35+MGvjMa82exs8lXTDPBaK4890KRIgRrSznt8vnNU636F1u1J9Gxd
	 qVWImvytoLKIKfOuZe2EAcNLvqp0OsNESVsrBW6dJp1Ug3OSMYv4fUe41CuuM4c9KCCE7
	 ue9GL9JUpog4Gcd7x2J2jQd8EZst2+C2lOPYML00RfTCAlaZn17UhKAtWg0t9gh0Cmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=daANv2owEleGHEwWXjX7Y1sfpf4L+AqmR3TChu8spLk=;
	b=0Jp1RBQZJ/+T1ifeDp+KHmKUO1zBrDuDc0Kg46SNzYzoj3bfCs2fpdNWodfGAfGXnDip
	 nlzo/DvIV2/9QtupH1KWDinkal0CgXmVJF7PlRIvlMfJAH3co5WO9XeaPJNZfn7pxz2JT
	 pUSjCfYi9VarZOzJopXwG+no17MLw3k9JA6Bn1Ypw2IEOv3fbdh8gWDJ8I5M1uMBc9VCC
	 YDH1dfSgiYuVoT4Rgd5yr88CnTlZdPAPdndBRJWP93E1OBrzLLK7l57BAxnGCWcErlLTt
	 tpp2v09JlNmE2RtVAaOyfv5FLvu/nIDDR5UhngpZdfmgmCvPRdoBiSVZpbfgrD7pMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QyBXwjnF;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E9606A326;
	Thu,  5 Nov 2026 17:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE9E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QyBXwjnF
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EiNgG2627463;
	Thu, 5 Nov 2026 17:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=daANv2
	owEleGHEwWXjX7Y1sfpf4L+AqmR3TChu8spLk=; b=QyBXwjnF75HgfGJXoudRq3
	+9akNI5kLom/+D98s3fbL/5ZH6th9jH73sTzYCeAaLdUoQp6zh45lWRheSk+nzVq
	p4hPXqs5jUnjEQKFmTzPhmKI8yGaOy0vs4V1Fzs106tbwBnpcgAFaQyZjyQuKjZB
	Qo5bdYtgH4MwoSJZrB3KtLlEEI3wZ5rSrNUYbTNdMpxx31wo2XFXsLX+fG2ukF2W
	VOtk3zac6KAfESs/c9VZTucCjZbEahnRceUUtK+pJcKUv7uMBaF5EnO7297/OHOd
	XLl6eNBSv89hWve035KHsH2mMA331uh0cn/ZjXdun9f9bVuOrhTew5t9dkPNFtng
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn6rdkp0f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:36:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Gou761746203;
	Thu, 5 Nov 2026 17:36:37 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hrk9mkg4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 17:36:37 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A5HaafD26346132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Nov 2026 17:36:37 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A99845805A;
	Thu,  5 Nov 2026 17:36:36 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEA2658056;
	Thu,  5 Nov 2026 17:36:27 +0000 (GMT)
Received: from [9.68.10.150] (unknown [9.68.10.150])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Nov 2026 17:36:27 +0000 (GMT)
Message-ID: <fbfb36b4-1ac7-444b-b898-f509f0b3c273@linux.ibm.com>
Date: Thu, 5 Nov 2026 18:36:14 +0100
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
Subject: Re: [PATCH v2 00/20] Unify code coverage and add Clang source-based
 coverage with MC/DC
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Alexander Potapenko <glider@google.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Andy Lutomirski <luto@kernel.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Ben Segall <bsegall@google.com>,
        Bill Wendling <morbo@google.com>, Boqun Feng <boqun@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Chuck Wolber <chuck@wolber.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Frantisek Hrbata <fhrbata@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ian Rogers <irogers@google.com>,
        Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Julian Braha <julianbraha@gmail.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
        K Prateek Nayak <kprateek.nayak@amd.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mel Gorman <mgorman@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nsc@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        "Paul E. McKenney"
 <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Sean Christopherson <seanjc@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Steven Rostedt
 <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
        x86@kernel.org, Konstantin Khorenko <khorenko@virtuozzo.com>
References: <20261103015238.3780910-1-sashal@kernel.org>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 8GuvPdtkZT98o2kwnst12PlIYWYluKM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfXyQy8yBstwcbM
 Rkc5xP/dYOg1fgJ+NWjdQN4tVTCYfdKnOtO/mNQOfih1iR+UR2rIx4PUzBiyrdp/D/15qOd1S+o
 7IZjnxHupAGDtkaowjEjbpcDPUtbTsI8ybI1rXejxheRgQDgIAGieHRt7+cRQvWxKQ9NzAd+XGG
 wvLqfJQjTu/uYqe+eJ1U+LoUufrhR9SN4PESkdQUpyVHKRY9nXCI55lmOtuHV7JOr7A9QdIBgzZ
 1MXgsu24oErNUM5kwh2EaBpswjBT0mmSDU6TgCmmH2WeVUppSEbeAfMNxVDBG7w9SMwwr+xg5pl
 I38pfZNQDJfAUYpOaW5jqzTWADH7ovR4dQwk4X5D+A4OjmMnRFV0GPSJ0VVFh0CJ8e3zB8GTK9G
 EetQPJbvHsM9v29Ud5JKECXRotYWXMk711DpQfJoDP2N66ktbFXYpY+iOwb4q4x4bkcBsCBSokp
 bW63s937KIzDicIaUCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX0TAlrJrb+pqq
 PgBa+KAxcOY+XVOz5FBHXV9251G+GkMlFvSTR4ejT+P1SGyL5tXhByO82fHDlGhDTpDMYnp2U6i
 oYYAX4uXsMKmzah/S4NgVZDPIqwtByE=
X-Authority-Analysis: v=2.4 cv=QK391QLL c=1 sm=1 tr=0 ts=6aecbea7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=8BOYBDInhozIBXGn-nEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qegOwV1GJ8hxllrcELoypkKbdceA7Ix3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050068

On 03.11.2026 02:52, Sasha Levin wrote:
> The previous postings of Clang's source-based code coverage [1][2] drew
> objections [3][4]: rather than a third coverage implementation with its
> own interface next to gcov and KCOV, reviewers asked for a unified
> coverage interface, and for coverage instrumentation to honour noinstr.
> This series first restructures the existing coverage support into one
> framework, then adds source-based coverage and MC/DC as part of it.

Thanks for driving these improvements to the kernel coverage
infrastructure! The overall approach taken to unify the different
backends looks sane to me, and I'm looking forward to seeing this
integrated!

I successfully tested the gcov-backend on s390 with GCC 16.1.0, GCC
15.2.0 and latest Clang 24 (git).

[...]

> - Runtime interface: /sys/kernel/debug/coverage/, with "backend" naming
>   the backend and its features, "reset" resetting its data, and the
>   backend's data files. The existing gcov and kcov entries stay where
>   they are, for lcov and syzkaller, and are linked from there.

Just as a FYI - I found a minor incompatibility when using lcov with the
series applied where it fails to automatically determine the kernel base
directory due to the changed location of gcov-kernel base code, but
that's nothing that should affect the kernel series. The issue can be
worked around by specifying the path manually and I'm planning to
address this with a corresponding lcov change once the series is integrated.

-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D
