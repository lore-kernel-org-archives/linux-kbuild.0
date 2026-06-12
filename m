Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740543E171D;
	Fri, 12 Jun 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250935; cv=fail; b=bbEETR7Kr2oiP3/9Qhd5PzKJNyNbjZvOrqi/kEqoyUbtCbEJdgAFadcU78TIvAws9d3zhNx7EbR5hg2gkTBvAWgXOjNuu3UaMIGixxy2xj2UWJ6BdWay1LlNL9Y+N3xRNFjNQB7/+FM2mDG+f2B8ohVAD4sWHvFjp7b9EI2B50U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250935; c=relaxed/simple;
	bh=VgEm48gfyMAZKSytSgzeiR02afNC3HE3WtUIjSa8ho4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KXIN0qIDHvRdjlfcKkhe/g3IfInqkr7NPbbO/6mJZqjgFiXnde/HzoLu/6xaIPhDmaa7QFogvRaKQA/gY7yw701l3sWK1RkcBodxyJo8f+A5jkjoBbLLd5bHV4vZhU4yQrKB2FmndF+7g2Hx5pkFOPNuRytaHfGSWtm2oqpVAd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=z8CzslTB; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="z8CzslTB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0kASxDXs2SImR6RYlN4LXFo5N37nME9Z3EHzvpVY2BdjCTMeRBveFVsHEpXOVZUXQjPOJ3CQeAYo+lldF8YVKDFphq8QoTfChEdtGTmVaWK1cd+42z4jT4+HENL1lcXMyg9+iMkir2cjGfCCGtONNvtLkyI47krrEjX7Ys3ESC/Ydt+uqrPD1MPU/ZpUC42dVoqqrE2YMFeff9JXvyOwQysqjeQPHp3QlGKP8vaXJeX5BGwhwlkANte/DC+GUOQ+yjNGyjAVGkFUyUr6x0xuGQqhvrB8uWX1XuluGmK4I9cAABtf6UAlO90mdk34sv/0T++dLZlTdyAqvGygzKLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rj9OqbpdjIXVi/3TqJwOYtgSstY/gAtyFETjKlg9E5Y=;
 b=ZP/yfYYZxZAVFVn5uszSdt9GBqVLBieGcmAzXkrUrOIJDNI2s0QAsGq3u2HywLPaF5ynmAzKzButH/4Ir64in6BS9MFtp8SzaAS7YKTfN+AJ+xCU1xjJ/sCPDcVnqQlHyEtAIa9MtWmg12dQapS3H7jFg2Csr+gxbI29JDdgfFT3qYg8YvpqXKfbUaCnRnOoJJo62hg/7eNHSBrgoQ8tjlPXtkCZf8G+aBRiq4JafYgZEppfSz189DsqkseTSYYn/+QFb2rjY63l0Dok9n5uH0FVGRkhvfzqF3UmCIxlp1MJ8aQsAiYhG5SPZeTMhpF2E6CCeqhProRvYlskTyQi2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rj9OqbpdjIXVi/3TqJwOYtgSstY/gAtyFETjKlg9E5Y=;
 b=z8CzslTBCcaWLju+FySBPof9YNu8hh+v9ndDeGjIjaejuA0D6ef8Sfh4fhapwkGpr/qsTdvSvKFNvYQWHWfD281/5bNDrpt7dbAxxkT3EwShDWmmrepya4fUyoTD/hEvb71iWHag7AIofyDKXHFny43TFYq6FMJSLZVWe2rUtU13LbM7CxZV/OBah29KM73QOeuXYkazB+wtFuAzbJOEcu70UCg0EG4QFWqJ04C6KqOBZO0x6vUFlewXB0DslaLrpJ1sg7Ha2eRUPI41DOVPFeWDwZWrQkul7bCn2cuUR1SKAp6w567fUGPdh3K43Bj6baI9Kr+R7mjgPN7XEgV6Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by VI1P18901MB0623.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 07:55:27 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 07:55:27 +0000
Message-ID: <59910826-ce09-4ef7-b14b-7d31faf4bad1@est.tech>
Date: Fri, 12 Jun 2026 09:55:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Dmitry Vyukov
 <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Yunseong Kim <ysk@kzalloc.com>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
 <20260604084115.GZ3126523@noisy.programming.kicks-ass.net>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <20260604084115.GZ3126523@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DBC0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6b2) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|VI1P18901MB0623:EE_
X-MS-Office365-Filtering-Correlation-Id: d61bf7df-62d6-4ec5-c3d7-08dec857f779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sop4020agTTdsBz69w/nreVtawrTeFsRw5mTMK1VIj3hhdUGmsizLeqsZ87aoWNfDW5b6vaxaIdOsEwUezyIXNAMLGGkBypVPGzanOoRqXWcHphxfeSQw+ILTEjjKJpHuSPRO/ctieScyT+Psk53uvRGWj22rkk5ChSGSe38ocYzU6/8+tMD9qJSYRlzFDgBUo4i5Cdz+W+x6LvSs2zCYfdKUXeUl1rjxVYMbhbOy3eP5b+rhStlw1zx5tMCgM+FUjWI2Kmm8FwxFfh4jHKnwuqW1jfzdiIhfGkFC+Az59RSA8U/O+xy8/WxPPkkOYkkHbxBEWOU0Y+el8p1t/ljp9J2IPvKgseWXRctwqpeM9WbzW4lFX0n+TGzoJluW7k47bM4uvbG/2e0QKqRQAhrcveWxQLkT9Y2LnR5iN84hnQ8IAcUbI6RX1cAGgVqNbbd8Du4B+cls5lI02lzwqyJ/++ZdFL4MsRkmhlju4zcH7BDXpQhObEr+x9EfrQ5VAMhm6kxGnJVwbKQMoJ2iy6hCmxO4KqhYY3L4dIh1mcBF2KlD8qLr2sSBrtrNwmaSx7d3JtSU0XcCZIzJ+cN2+5LYFYUk0EbgvFlrBULYJ7UDic0K3p/wY8TThJrCG+DHq2REOySZKZBcaPqS4IFHxGWmahdJvmpD0caRoAfQqgWAR6IYHqPFfIz+Lnt60/UlUfD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU83WEZTUkJHb2xiY2tJYVlEUFZOUHR1WGNVM0JDc0FzMVV4Tk1LamJXSmR3?=
 =?utf-8?B?TGpSWXNqckNzL0xDZ0RZck9LWVBkYWZrdDc5TmJMVWh4b0Nyc3QvQnFIMStp?=
 =?utf-8?B?TEdkWENaSklsb21Mai9ZVjhZTGNVdk1pK2g5VHdhZGszQ1AxMGNKeXdYMUhL?=
 =?utf-8?B?MEV2SE92N0toRkV6d2JSdzMwcUtFN0J5YjdDSmdvRnVscFJxdVpNK09vTWFp?=
 =?utf-8?B?QUE3Q3loTWdzZWZKb0VYL29HdDB2MGdlb0FuOHpDR2JLczNuem1iNUxhWitx?=
 =?utf-8?B?dFFiRlBFN3hYNXNKZzNRVWJnT253bmI1cFB3ZVJVNXAzVmdNZUtlOXRDMGMz?=
 =?utf-8?B?VzBKY3ErSkg5eG01VVVCbUdXcDBhSWI5TVFQR3VlMk1WNER5U3NzUWQyVEJw?=
 =?utf-8?B?d1Qzd1dHNUlTNnF4cUVHaDF4WGhWTVRRUHNQL2tiOFRGWVY0UHdCa2h3Sk4w?=
 =?utf-8?B?Tm5kbnJpdzV1cjlkZnUyNUpSWW1zZzJMQnE1SU1zemIrRUw2amtGY0ZsRHlS?=
 =?utf-8?B?L3ZTVzlraGNydDFOZFEvT0NBakt5N2tvWjlHaWZ4ejVhaTg5SXROYWt4aGpw?=
 =?utf-8?B?QlB5ekJRVkVTODkzQUpObzR3Vnk5bXZMMzlVVGtOeDRLanpNeUVYbEN5RG1R?=
 =?utf-8?B?Wi9rU2t0VUtuMWxYSEpiVS9SSUlqeTl1TzdIUGZOcTVsK2JnczcrOVU0MU80?=
 =?utf-8?B?Y2xyNC9LcFpQcDd4a2Zpa2dhb3dLZmN1VGtvY1pRK0Q2bExxQmZuRElVZ3lZ?=
 =?utf-8?B?SzFyVUJhOXdlWGFqdVdYNjU5MFlMZ0RQbmV4andjQW54ZWFXaUh5djFGb29R?=
 =?utf-8?B?QnlMNmEwY2xwOXhsSzBsRC8vM0srRlpBTFlkc2ZYdjdnMGNKNVV1eS81SExm?=
 =?utf-8?B?SmRzUkxxajhOQmxXeE0rVFVZaFJhM2Fzcm4zalcvOWhOU3E3NjYwTU54ZVhN?=
 =?utf-8?B?RmI1ODJHTnJuS1ZlNlU2bjBTY1hNT3hUWG1hV0hzMXhtRm5XZEVFUUFldjB6?=
 =?utf-8?B?Q1ZGUkk3K0ZLVmRFL2Y1YzJsZlFNRDZhT05oUnoycW56S3h4WWswaUwzVFAz?=
 =?utf-8?B?V0xPY0RQNmVPQUNkNGQxRTF3NG5XVG1sM2hqRVhLdktpejc5dUpjSkdjS2p4?=
 =?utf-8?B?ZE90RCtSVVpnVVVzQXErd2Y1SUVseVpWWExkUkhjaVArbGFST0Y0RlJMNWxm?=
 =?utf-8?B?Tnd4b2J5bmR4dWhTVGFBTlFrbzF3MGRUOUkxZnFLc2FzZ1QyekFXdjd3MHdw?=
 =?utf-8?B?Rk9uWHI4R0VIcjM1ZGlkZEVQeHBja0tuTzNrV0JQSHlmbXFnUXc1MEF1Y2Qz?=
 =?utf-8?B?WHdmUkROK3pVZ0NZMmJEUC9udmdZMld5T29TSFFEU3l0RDFHT3cxYUZwSXcr?=
 =?utf-8?B?L1J2QjZBSzRBb1AvVVJOOFFLT2w3WXlSWnNHRWpFeVhlbThEakZSSGsrdjVW?=
 =?utf-8?B?YlhncStvOFo1SVRsTEJCNVJOTXR0bTRZRW9rSElObzc4WThmZ1Q5aXZvUjRs?=
 =?utf-8?B?OWhGWWlOKzJWdGYvVEtodEhzTkorbGFiUjgwWGdsRk9Wa2NaSGo2QzgxOTk4?=
 =?utf-8?B?OVJseTA5MFord3lGNEdGR1A0WmR1RDNsM2t4bEdPZll4Ry84eGVDUk1QVkRK?=
 =?utf-8?B?bXJmbkNoYWpnenh3MFhQeVgyZndEblA3cHQ3eGpHbDR0RmdURUF2NENRbXhD?=
 =?utf-8?B?c1Q5UytHRmgvUWt6eW1Wb1ViUDVLNDZlaEc1SlNRMWYvSDlsOUhYMzRvd20r?=
 =?utf-8?B?MFhzWTNLTlZyNXBJVEtuVTMxQ1ZYa0ExZk9yRzFuUTk0ckFCMVRKRHplUmVv?=
 =?utf-8?B?Rndxazc2MHRsWXMxNG52dzZLOHp5UDJZdVZOcGs3dHAvelZOdHRWM1ZidU1X?=
 =?utf-8?B?SndIR0RrdkF5UmFqaEZTdjdEaHI3NXlGNDBNaU44a0ovVExQdm5ZNlMrakxD?=
 =?utf-8?B?MktxdlVsTFB4QnpvOWVVY1c0cWYrV3Y3T01OTTdhWGRNRGw4NElzb29tSm5X?=
 =?utf-8?B?R2Rxc2VMcFJOVWQyY2IveENsRE1ERGZMZzB5Zm82YTRhK29mNjdRbjZ6MDVl?=
 =?utf-8?B?TXZudUhoMW9zT3VJOHd5cTZSZWIzRVA2RUFCSkNpSmxRRVY4dTBrRGo5VmV6?=
 =?utf-8?B?cEw3MU5zTjFoR3hRQ3JvS3hxR1NUd29QTFBWa09aR2Z4aWJDV2JVMXBOeG1F?=
 =?utf-8?B?SFQ0OWd5UTBzTDY2dHIvazZiZnBZSmZGVWV2VklyNjcrd1FNaW12aEN2R09N?=
 =?utf-8?B?a1Npc05BcVozRXR3VVBJc2NDZG55b0RBT1VGZlI3RlRaOU45Q2N3NGJVcGpL?=
 =?utf-8?B?Vmovd0RJMzIwVXU4cmw1VEFhMnpLWWdYRFkxampFQlI5S2dYVm9SUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d61bf7df-62d6-4ec5-c3d7-08dec857f779
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 07:55:27.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hraVacp2w0pQ0fGh/JuYgaqN4N5OQNEOg4FwIv97vGHmbT67++22UEOYJnamo6Sq9LvOLdvbVnirByBOHnxQCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0623

Hi Peter,

> On Wed, Jun 03, 2026 at 07:43:28PM +0200, Yunseong Kim wrote:
>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> index e2f976c3301b..abd1a94589aa 100644
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> @@ -2261,6 +2261,28 @@ config KCOV_SELFTEST
>>  	  On test failure, causes the kernel to panic. Recommended to be
>>  	  enabled, ensuring critical functionality works as intended.
>>  
>> +
> 
> ^ This line...
> 
>> +config KCOV_DATAFLOW_ARGS
>> +	bool "Enable KCOV dataflow: function argument capture"
>> +	depends on KCOV
>> +	depends on $(cc-option,-fsanitize-coverage=dataflow-args)
>> +	help
>> +	  Captures function arguments at entry via /sys/kernel/debug/kcov_dataflow.
>> +	  Struct pointer arguments are auto-expanded using compiler DebugInfo
>> +	  metadata, recording individual field values at runtime.
>> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
>> +	  Requires clang with -fsanitize-coverage=dataflow-args support.
>> +
>> +config KCOV_DATAFLOW_RET
>> +	bool "Enable KCOV dataflow: return value capture"
>> +	depends on KCOV
>> +	depends on $(cc-option,-fsanitize-coverage=dataflow-ret)
>> +	help
>> +	  Captures function return values via /sys/kernel/debug/kcov_dataflow.
>> +	  Struct pointer returns are auto-expanded using compiler DebugInfo
>> +	  metadata, recording individual field values at runtime.
>> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
>> +	  Requires clang with -fsanitize-coverage=dataflow-ret support.
> 
> Probably wants to be here...

Thank you for code review. I updated at v2 patch.

> 
>>  config DEBUG_AID_FOR_SYZBOT
>>         bool "Additional debug code for syzbot"
>>         default n
>>
>> -- 
>> 2.43.0
>>

Best regards,
Yunseong
