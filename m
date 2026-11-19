Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094643;
	b=eNvdVDqUXDDLKi7KFiZ7QSPvKnZhJNhjqGgpWSzH5joMnG1YIdFs5/fEGKwpHUEFeUos
	 T+qswO0hDI++48XdVzH/RtGjyeJpbsSA8IGA8Bebd1niWDJRR1C184XWxqp6ZDframDVJ
	 lt8Af33MiKCWfUwEMFYV8I1G+LuVlH5xpwGhPhXs4KLHMi+ZTgmWkE+ibcjjQgWAhBVTh
	 6anzRvmcrGaOXW524TYWj751oj4w/4Ra8Z2KyxOArjlF1Bgnbq6QTVuAO0S/S+gd1l2ia
	 flqLctujqNUPI+DdNQxSxxL5pIfHEeSsbnuSfBnMd7LQe3hkMut6OVRjI4VeclfqSfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094643;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Content-Language:From:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SdYCrdVp0XqnuYHotYtw5UFEIetHJ7MLeqFH40ztQ/E=;
	b=5hFDVTnqj5pSfPqikmgX5S5mELhEUKLJwVQJdduEkSTPhozRN+T7f3DaOT0MEoYcGJgF
	 iYx4XgAYtthirZ2BnzhlkVkb7BvJNjARvcm/awkmxzOxv3mUuBbn25h3OyCNo7SwAFZnI
	 v801sK7EFZAWQmapvoxXj/Gx4HOze+FMEGAeszw+76JlqvCrChHKeFvJo/xzBwwS59Kgf
	 2MoP2Aebi3V1M+qQRpiSSi+7szODtxrrMjAJUmKF2LTU9tTcDCqrlz/EJf/LWehqBr5Vq
	 EUeu4wSBM0I3I/J5/5J2w5PMwBH6hiL6Tj4jqz48scpoxgdT8XKKg5C1BP1Byhz9ITQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=S7HcpT3M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E860A2608;
	Thu, 19 Nov 2026 13:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34E860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=S7HcpT3M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIchDvSXP/vjjssh8WBd1fxOiMFN1+2LvlQLr42kDxfXYFN0RYpR4cWhFDNRC125aCVYjOlA2qgUxTQsRMwC2Nn4zjzeTqEl+kEtVhGpVnpdb4NKzSvPZik3aXiCj+Hi3KnhfyYhebh5Uaz+2N3HIoPtawxndbgJwY+YjDy6hVqsAToIRPodaultaCL5obNhqNDvf7Jl2G15PsvsWi6/5lXFGAA9WVicq7gmsNpdjtj+Pq5gA2yfwTJPF8rUQ4KR/yyYAwxWK85HPOuA1Si3/wh0DiOyYUEtUtWLM8o+OH2gRq7WlwCdGiIqgb7H+19nkcI+3K6PNzlE53k5ANgpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdYCrdVp0XqnuYHotYtw5UFEIetHJ7MLeqFH40ztQ/E=;
 b=tT6V6CFowBbcBG8DgeeuUzHwkmKcOpGzgIAvveqEtCfL8Y5OaYhpGYg+8zun16xx8gBvau8F3GVIdMO4p/bZb164nuaHVXRi8+xeRAKrdZ8VLd+p0aeTaTqa0V/TUxlbSnkCXNjWe9D59O0jKuhKkHLC1Q7/nN2rFKrGznFNEzig9PwOJ7LuTXgFyKvHY+23vkt99PhaG0yizzJ4ykBDjvS6JepKqsKISydVkDZONeheePdzQlxStelvKPQmErQDb/+CtsZpyFnBPI+VIz/eFrWtWfvfHaruu/Z/KCT0X6pnKkqMbt0PUfFr4Zg69b9GdOjcQKiozlpWnMRHDbGnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdYCrdVp0XqnuYHotYtw5UFEIetHJ7MLeqFH40ztQ/E=;
 b=S7HcpT3MVsO90FhGPOoxMxqw55h1oC30aULnCCLiq7QmVBRIfiAqk+A6y8pbnRKk2dSj4YYEKuNOw/WAbd6tIT8fjuVykxmGOD3x2dTkMjnAt+lKx4kJkK2VVbZfGIDSy93raNVynfTlq1jAjbaOUc3JzKpyYm3yzORJZo8G/8zAROsDtkYEEvC8BbCOlMhtCLDRps/DW3u/U7QacY3rRuwZXx+WmTwGduqdcl4r6VRyCLYYfjd0cKUXiDbgmFOR3coAEYhFs6U75BgewYeg2YmuhfsF1B2CMV5IkhJ1hpXPn3sqFpcr5hNP8cAH4GKFd1aAzzaD8nucjDoI1LGjWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::22)
 by AM7PPF593EA3408.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::695) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:23:55 +0000
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a]) by FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 13:23:53 +0000
Message-ID: <624efab4-f1e3-4bd1-8ddc-60bba4b5d798@est.tech>
Date: Thu, 19 Nov 2026 14:23:51 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yunseong Kim <yunseong.kim@est.tech>
Subject: v7.4-rc2 kernel build failure when using the upstream LLVM 24 with
 -Wunsequenced-volatile
To: aaron.ballman@intel.com, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittoteggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <kprateek.nayak@amd.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, thakis@chromium.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::15) To FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:d10:1a3::22)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP189MB3398:EE_|AM7PPF593EA3408:EE_
X-MS-Office365-Filtering-Correlation-Id: de06fe29-115e-4033-7540-08df46405b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|18002099003|261009223027099003|921020|11063799006|261026140227099003|56012099006|261022105027099003|261028144727099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vW+bZ7wAbfaaoC+20Gp3BAlJ5pOzrptHAFGlbC+u9F2a1vinelf/gJ+LXxi7wtc3jAVf8I9oS0T6xIC3/VNmPvxQg3/HDrlhD6MDsGp1vPgRDhonzYGUI1/NfeRZr2Ez6HqsuXURitaAODpmCB+jRZTHn8irNeziFaAiq5jWjF7igG7zaqjm1I4QIICl668bh7rLi9D0K0fUQh1y5JuxHrcHe90AmcAc5YZcxAs5+B68Gx3CirS5U+09UOm2tytverwJ0e0lsBDPzETYwvxe6PcF43RAC2xKHYgmv9cTcreybv9kmfQrBs4sE7Nc2V5XTHBjlIpRt07AmWYEVUztpoorN3ttXnHxhWbuHhs1Hs2sQldoG22hbRAg3fpoRGNQd2vo3+Jt3P6ReWJWM1wZiUWCLW3wCg0RZoNLqwmCCvU3MxIdVCUlUp8a26173Xs/k6ZiEzgzLynqYNvH80kxfjpJnjJusmFg0cdP+tmH13yOBLSQai8+zN+XVZkgphqrFv+8MGLi4EJOrXb6Ok4hLmI2by292k+M/4vthxwq8spYAQsDAt3roOcoWgUuV8UU1J3I6KGFCVRxKftQ38SIk33x5IhMNhRPeyRjKHf9mYfCRZzaF2dql/Y4QL+ZYQZyswR64fJfCO/ftTnpE20oYKXemFcAHlhPrdCOcLC83bivPo3ibF2me/RNCrzdcX7zXiaKaoql5VURJr/jndWT/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP189MB3398.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(18002099003)(261009223027099003)(921020)(11063799006)(261026140227099003)(56012099006)(261022105027099003)(261028144727099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmRJb1JUQVRsdVovMnczU1R3akN3KzlhdytiT2NDWUVaL205YS83ZFMwbVBC?=
 =?utf-8?B?R0NUa1lFdTVGUzNpTmFqMnp2NkdIYkkxaWVaNzYzS0M4S1B2bk9tZGVQTEJp?=
 =?utf-8?B?dU5FR2k5WEZXUFdsOXI3WXoydkc3SGtPekhnTlVJN25VN3IwZjZwZWQ5VGxj?=
 =?utf-8?B?NGFVdDhEemZDR3U1YlNzMWtHSjIwaFZ1N2tleWRjdkNQYXl5L0QrbkxlRkw5?=
 =?utf-8?B?RFQ1dy8vNGpVRTZlaCt1bnVBQXpNSG5UU1ZsM3hKY3BQelVPQmNQOUIycTNF?=
 =?utf-8?B?K1dRS2lqUzlSWUhTSG1BMlBVaXZOTjMwNUJROWt6alM3bng4OHJyYjRyeHhN?=
 =?utf-8?B?TmZTMVpycGo4cFlmbDhQanUyNCtQd1ptSGZXaklJU0RLdjNXT1JLKzhEbXdH?=
 =?utf-8?B?MG5ZdUpPWFl6WTNGT0xzRHVOWkd6di94MkdmQkZNMkR5YzhXZ3dTRnFDMi9w?=
 =?utf-8?B?UWgzcFpvdkZPRjl2R2QwU3NDa2JoYjE2ZVVsNnFuZU50MXhUc1k3eFpwY3Jy?=
 =?utf-8?B?NFM4Mi9CZm8rV1JITzgzK1lkTmUzTGdIN3I4L3ZtYTVFTzBlM0EvSnR4UE5l?=
 =?utf-8?B?NzZrUXlmNU5Cd21VOTB2bG93YThUaGViZ2FFYnNLWE9YU0YwQ29HYllwMGtP?=
 =?utf-8?B?SWlIek14eTdjQlpBZWVsQS9pcDdYUW9FdlVVNFRweThJUmc1RUFlbjFkQzk1?=
 =?utf-8?B?OTc5R2xlUjN2YXlhTHBPbkVSN29rMURRQ2tIaGsxaHlVOHBJT2VoT0I3Zmt3?=
 =?utf-8?B?UUJEV2lweFBxUG9wZXRtVTFwMzVEWk1WMmlSOVcyT3IwL3gzL3RkWE42STlN?=
 =?utf-8?B?R0g4MjFyd0F0emd2OGtKa0lGWmJuVlkza09uSkJDMFUzdWpxSHpmZUYxMDJl?=
 =?utf-8?B?U2xyVkdxd2p6OURhSU1NRDJIMHg2OTBLZzhCTnJ5L3Zna2dTVnRtc3NESzBF?=
 =?utf-8?B?Z1BjamtZWGh2Y2Z6ekhzdXN0MmxETUFHaEx2Ymh3KzErQ1ArMGtsUkJ1a040?=
 =?utf-8?B?MUNJeTh2WHpaZ1ZtOFZicU9Zd2NNVjZjT3E5UFlaQ3hONDA2SG14UkNtZWNQ?=
 =?utf-8?B?V2JUYmRIVUtNcEhXSis2d0NLTGV0bytJcTdhY3pPRjQzTkI0UlduWmJGaXRR?=
 =?utf-8?B?dVZuZTNQVlJDb2x1WnJTeFdRaStMdkdPSkl2TTF6RStmcDJNbDlzeE9NU2Iz?=
 =?utf-8?B?dS9XQld3QnBlYUxpcS9XZDBqRllVSkVNUHQ2VGJMSE81em9TMGxZcmd2czhL?=
 =?utf-8?B?QUlaSTM1T2I5UitvZXdiTHJKVERQM2hNeGwwOUdleFYwS2lod0tWM0VRRVJi?=
 =?utf-8?B?V1h3RzNrQUI2V0ZjZ2l1R2JJZVhVcmh5c21RdkFDWmRUTURoMUVVdmdyOXM3?=
 =?utf-8?B?L1FDYjdzaDhPM241MTRyVGUySzRkWE9tQXlLZHJyRWJHUUE2cnFNUmFDTitt?=
 =?utf-8?B?RUxDaUhpZ2lCRCt0T0ZVTnpMa05LeG5wTjk5Rml6Q1JFSkl3NTZZWWIrYXc5?=
 =?utf-8?B?Sitha1ZnbFA3WVZ3ZzZ2eXRKZGJYU2RveHVWUEhvSHVHVm1wMGVhTUQyYzRz?=
 =?utf-8?B?eURkRDlZbTY4b0VuK1Z3WmFoWmV0bStQaUduVnlsUTZ0OUltSnRDU3B4Qi9k?=
 =?utf-8?B?dEo4TEFBRlFJdXVsTHVBWVBKRVhHd0RkNUFUdCtPS0lIcWswVDUyajJpeGdD?=
 =?utf-8?B?ZERRYlBsN2tLdGJ1UmZVNWo2YlhETjJWbU12UWxsSSt3ZE1XWW1OMk1BZkpE?=
 =?utf-8?B?MmMyVlJQOWE1cWVSZEptWFVQSXBva2sxOFVUYzNtaFNGcHltczN4WUNpRXhC?=
 =?utf-8?B?dTU3WFk3TlY0MFQ1ZmRPYjNrZjhpMUppUzNRNGNoTVkwZUZSUmJCMzFTVEc1?=
 =?utf-8?B?QjdjTDU0UEdmVVBFT2VkeHZkV2R0QmhDd3ptQUhGdmczNzByQjRWU1NDblhC?=
 =?utf-8?B?M3VQdE5ZQ2IxT041VzFrejdKeHdwdnlrOXBoU1p5ZVlBYllGclhqK2x1UlRt?=
 =?utf-8?B?SGdGQ0lXK0FnY0h1Yk03WjBIWmlleFY0QzdyMkZtWnVuQWRGYmVEOG5vRTlR?=
 =?utf-8?B?MUhacDNCQ3gxODZwa0VzM1FRQ2xRbERmMi9Va29kVUlhT2oxWnduTUZHb0xL?=
 =?utf-8?B?ZC80NGRncHJncS9TaFJiR2RVVGg5aWkrYW51aTh2SXZIUG1iYk1UcDdwaEZV?=
 =?utf-8?B?Z21GWWdPZjJnTWZVZmsvM0NHZDQxeGdueWZYZExCRjRJekhHbGVHdTBHRkxQ?=
 =?utf-8?B?Y21CZHYzSWo2UlRxc1c1UWl5OFNCV3Ixcm05MUlhcWR6QUt3OFdndzk3NmNW?=
 =?utf-8?B?aTFPUnY4REhnL1A5ajA5dUIyTWpBdkNPdVJEb2ErMUhaSVlNbzYrUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de06fe29-115e-4033-7540-08df46405b4a
X-MS-Exchange-CrossTenant-AuthSource: FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:23:53.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqZJ3FB38zqScSHVOJe20u8oq6wUmnaaiPkMIKYPN9im3FFSAvNOFFo4l73oJP34BkNxoRSCGwXiVG5tsKAk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF593EA3408

Hi,

After https://github.com/llvm/llvm-project/pull/180955 feature
"[clang] Add check in SemaChecking for multiple unsequenced volatile accesses",
v7.4-rc2 kernel compiling with the upstream LLVM 24 was failed.

  kernel/sched/build_utility.c:86:
  kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced-volatile]
   1998 |                 .last_balance           = jiffies,
        |                                           ~~~~~~~
   1999 |                 .balance_interval       = sd_weight,
   2000 |
   2001 |                 /* 50% success rate */
   2002 |                 .newidle_call           = 512,
   2003 |                 .newidle_success        = 256,
   2004 |                 .newidle_ratio          = 512,
   2005 |                 .newidle_stamp          = now,
   2006 |
   2007 |                 .max_newidle_lb_cost    = 0,
   2008 |                 .last_decay_max_lb_cost = jiffies,
        |                                           ^
  1 error generated.


Is that mean topology code have a potential issue, or is this a compiler's
false positive? The same error message can be reproduced on the example
user space program.

  $ cat jiffies.c
  extern volatile unsigned long jiffies;

  struct sample {
      unsigned long a;
      unsigned long b;
  };

  void init(struct sample *p)
  {
      *p = (struct sample) {
          .a = jiffies,
          .b = jiffies,
      };
  }


  $ clang --version --verbose
  clang version 24.0.0git (https://github.com/yskzalloc/llvm-project.git 5d20c85f4e1b8755b655bf1782b094fb35ec48d1)
  Target: x86_64-unknown-linux-gnu
  Thread model: posix
  InstalledDir: /home/debian-sid/kcov-dataflow/llvm-project/build-upstream-check/bin

    $ clang -std=gnu11 -Werror=unsequenced-volatile -fsyntax-only jiffies.c
    jiffies.c:12:14: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced-volatile]
       11 |         .a = jiffies,
          |              ~~~~~~~
       12 |         .b = jiffies,
          |              ^
    1 error generated.


Thanks!

Best regards,
Yunseong
