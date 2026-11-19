Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097616;
	b=vTLY/WQXDNoMuWlprs6CFF9KpJd2HLDosOA1fQLQyVQ4gSSFXm0zQpuxd4P3N673KbfK
	 HobQYKkTedKo4WMggQ8sfICLwyuIJXR5bHJGaYkTN9SSeYpvVeHagUkRHY9S0fIsQpxKE
	 rzrj2WWIh7izqfg5GTNNSdeNdXApnB/XIRo7Mllfv4BuYm9v1hUR2XXt9rKIkP3HmWwkM
	 E6w0FAymF5BTKLyw06METgltPSKMrmDBzJzIoVpslHLotuDcMUgSXr+U27uh9NrA0hezl
	 +gTczGmPch/mreMDsI4eMRUFz5PXDEeowxY9a5gKqD+2qnekFqUZP1PqP58Udo5B/WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097616;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=/vTTqoR/vcy+eFgmw3dTdgA1asAPBIuIu0TfuV7FAzI=;
	b=ltGinb6fg/sAr4xVlHBuRGFIqhbKiUQy2R99jEg/aE5OOZlDMyYDTrAlMRT/A+ExrdNe
	 urbMDOzJtEcflMd5T/H+UIhfN4/wiiCYKyJAjzLW7VTIPi+r+bVM8WbuXZvqPmYxxOKMG
	 Fp2DwC8OqyjLrDlCMF8/zVci2ahCZrzfi9FJw/vWDBSiBVIPRwYxWIbgj8brUHVuWAx5M
	 Dc3VwZddWqGGEWGK76a/OLqzCFTUgOQ096ZcP0alMilV7FZg+VT2THBPWInxfE/fn0gNi
	 l7YzgEDydPGtWNsP69o3kS54+IXjyp74bhcysA2OuXH8+2SzL8THEukmJIbpee6/hHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b="GRUjv+V/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.39
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F3606A320;
	Thu, 19 Nov 2026 14:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=GRUjv+V/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvq1LBK8bSEmaN8f2Io0FFYMXpXVW/APpqxT5gozx2OSWrHw3965KsVfkAmXamXfI3M3wwgcBSGWex3CL++P+OhpXh6IFOWo1VFNlrQY7JGaY4Pq6EYIiP/rHauhhEZJ1b5uISxk26iN7JGbA17InHFlTaaBXAAVJFOhEi6ccHHidv3EvNiBI5e+AhddqBgWmIWLyHOxvP/xlIcX1i269P+wkm0u5ESNSBgLW65EGfQ+r3Y0bs0xKBRxmZSIYhkDEnzRkspBSAsW003Dhl1qWh1ycePpAKzh8Os8x0EnU2TMsSbB/Au3M371oUKY0+nuGpVXBoV5S4E3oPiqtzrmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vTTqoR/vcy+eFgmw3dTdgA1asAPBIuIu0TfuV7FAzI=;
 b=uf28QXs4ADpi7p8hgJTcUHUtuC2Ivq047cwE8K3+S8wHVhsELZV5ZJ2CziKk2z3eAy7dpna+mgTK7GPqwFYJ+ycJv86z9bbdkopDqhdRM6HSEfhCIQLzvlKBC2TiiWQ2hkrMW4XYeGKIOP4VjzLFKv6c3/rILm+sCmf5h2t2s6BNNdJT7rrMIoYS/aXdzo7vd66VMr5+NDan4kAzPlJr28NJI15w+xN1eMu1vzzp0PB1qfXoRqvAqOOAyNU4rJtvkXHL+7yMH9HZ1Xazxx3whAJJr5/FMYNESWIv5Lqcnqo6UflA5vAH1nmu25aN54BZbH7UARLiw1uKJzGb+mvQpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vTTqoR/vcy+eFgmw3dTdgA1asAPBIuIu0TfuV7FAzI=;
 b=GRUjv+V/wFoyebN+4JIXhIl5mKtWa3MYZ5IOUfMqb8epIfPlqOmUuNrvlxQqSj/b+daGxzHSNfxsNN0xcqXX/McvZcW4lBcViEnK5VoholXu2TU9X5YQeczIncL2DgSCBaLp0ygBEXV5UBBjNLv31VEzRWaHi8LGQTTbLHpdl8NSTRCqzNIIwBl0zQylpWwmpUcwS31B7FH1FIQJuknk8/DFy6gQ9+jfjen6HvcAGdkI0vdvzmrlx4SSqZS24bX5RfrQcw+u4ya2IZA3kn+lcXf2/9DZN/OkK6xCYayxVs58PGsrzQ+NLIqprQesvkcJrdYcMICRTP2+3h88K5rqkA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::22)
 by GV4P189MB3631.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:28 +0000
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a]) by FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:28 +0000
Message-ID: <9f454ef5-cbcf-4b8e-af18-07fb84507b4e@est.tech>
Date: Thu, 19 Nov 2026 15:13:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: v7.4-rc2 kernel build failure when using the upstream LLVM 24
 with -Wunsequenced-volatile
From: Yunseong Kim <yunseong.kim@est.tech>
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
References: <624efab4-f1e3-4bd1-8ddc-60bba4b5d798@est.tech>
Content-Language: en-US
In-Reply-To: <624efab4-f1e3-4bd1-8ddc-60bba4b5d798@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: FRWP189MB3398:EE_|GV4P189MB3631:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f0abe0-bec9-4f91-9379-08df464748a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|921020|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261022105027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	lF8jx7c1vWDP9vjOZtmMv9wc97cs/f50ynob8edONM2o6SoMre5dzCnytWqHlAQ2X9ZD7KcdyMmevpQMeGpppqETxrhIytuvi38KwTRxUKW0kUvgb3Vbpy/YW2VVCfOIdXAzG8dCMIJot0koU8xyt9CdaeeWyDkb36FUY4LF8/sLTqua6F1MTv7MdAxsxBybMy4dTavxiKqeqVJU3+sO6NniTdBzi4FrFLL/N1yixz0+jZo8gp183SWco4OCN/1V3R8+hBQtRWjJ5J+45nH/6U+xfrrT36Sfq06pvDAb6cspg8ngLfpaUp06DjgryAw8U+8wGbxIp11dPo8IXCwrn3KF8FKHNvJ9/cuhne4L61ZrCbnww1wGk6sn473JMsWaCobBlXFcU3n2k/AVtJxMh97f3BvzZTw8o5PhtDelzgkX4nhmZiINiVsxypVlcCb/iRKTQcjo8F4MGOp3KGhNfUKEj6BO85bFU2sZqVbOHI+GXUgFTTnW7JT6617tFpRwJiVpGuxpFR3ppSzpBsKhgEztWn3ApKS7gKuM3889Hh9c6QIlmwBAL2ZFf2YZFpdsLXkNKPamKYNnS5pp7cjeMaSwKy30KP9LCLiXyO789t/ElQtf8AH8vJAF73FFQa3SlCBkjXWJOR8buQAfkCJBs3Q7J4ao/CfCtqnYbGnI6VM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP189MB3398.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(921020)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnUrak9zeEZDK1Z0QTNyTFFjaUMzNjRKOFBWOHFRSjVJM0lKQTlDQjRQNUN6?=
 =?utf-8?B?Um01U0ZKVGVOUkdFK1ZHY09IUENNd2FwSVNkVmFpQkxvVWVaUzE0VS9ZOGEv?=
 =?utf-8?B?YStlem5xSGtZOUZtOVVpRG1DZStxeGpNQVBFb2thMVZvaXY1Y3luSlQrdmN0?=
 =?utf-8?B?OFgrYm5GdTFHaVN4TVBXOFU2RjV5T3ViWVY2TDBiWGVpODcrY3BMU2cvODZP?=
 =?utf-8?B?ZXpWVVR1NlZiMGxyY2x3NVdBeUhzT1NiL3RIMHZUY0N3MWhyRHdDaTFHcGxZ?=
 =?utf-8?B?dStPQm9HNkcrK2VlRVcrelprUWdNbUY5bUtpdUVvd1lDZ2p0Z0JRUzBXb3RH?=
 =?utf-8?B?QUg4djYxOENPSzRkSG9XWW1XUU0ybG5QUWlUZXdZQ245UWI1L0NpT29saFRT?=
 =?utf-8?B?UEl3aE5tdTJnNHBMWmhiRy8yU0JyY3IvY3psQk53dWtOa3lLSXA5S1JBcVQ3?=
 =?utf-8?B?TzhmbEgvRm1vRFJnUnkyYk95T1VJNTJaSlRZL2dTNHRxeFdKTGtKaGw3TXBk?=
 =?utf-8?B?SzJ4QkkrRHVPQXcxeml5Tkg5RG5aOWg3OWtEdjZGNUdTdW5uU0VIZmp2NzJh?=
 =?utf-8?B?ajg1UjRQMTNQdkI0bXlMTUZBRG1yRi9OY3JrMGIvMXkyQU9RM3NSdHorelZU?=
 =?utf-8?B?RGo0VzFnUy9PV0J3LysxanUxMFEwcGdXcG5YTEdRWm5vR29sbGxNbWhsYUtl?=
 =?utf-8?B?ck1zVStISTdybXlDUldLczJIWFVUVUhVVGUwWmhrZHpud1Y0YitqUGhLaDlB?=
 =?utf-8?B?MjJJWEFqQVJ0WWs1RkdiSy9TWFV3RklXWFNpV0hWTEVGa3ZKVm9JalZ3SXdq?=
 =?utf-8?B?VDZEYlozaDMxT2c1Q1BRMzd2WFg5NHhGZkJkb0J3eklzY09XZjFMK1BubkFz?=
 =?utf-8?B?ak0xKzB1RjRXNUF6MDlJbHlxT0JhODJ1RGJBaytRQVpOU2lpVUE5eVpIYk1v?=
 =?utf-8?B?OVZNQ3hPZm9uUjBVTk9GUVdNd0taREh6MmFoV1pqSXJHdUpnb29FczFleGM5?=
 =?utf-8?B?aWFLSjN6cnJINDdwSGVhVVpDRHB1UUl3eXJodElHYjQvR1cvbTQwc3FDWkYx?=
 =?utf-8?B?R0l2bUhlSUt1WXp3WWhQUG9semk1RlNpSklJd1M5L3RCU1pNbWdqL0lMRW9w?=
 =?utf-8?B?UHpJYTlMcUhDc3k1OXoxMzY2MWZ1Zmp4diszMndWRlVWR0dZcmdPT2h6OGdG?=
 =?utf-8?B?TkNYZUs1cDZmSGJvdVZZeWpJLzBoRVRocjBLTWZLaHBYaVUyY2NwemRnM1Jl?=
 =?utf-8?B?eWtnMERBYjFQdnFFbUxCQjNlcWpjTUlWT2pzL1ZMK0JVbmVIbnBraldvQTRK?=
 =?utf-8?B?d1BXVXdwVy81dkUxaXFiK2ZWRGhqMVREZytoOGtKQWNTbHRtLzNMRXJQcllE?=
 =?utf-8?B?MjFrS0FaU2NkV0Q0citucEVhMWlXTFQ2aU5iKzFYUjZ4S3haV3dYT1FtaVdP?=
 =?utf-8?B?cU9IeE4zaGo5ZFRHOWp0NHlEQ0QvV0t5b2xWWTJIOE5zdVU5cWV2QjRnckVa?=
 =?utf-8?B?L2ZPSEtMa2pYSHUyYVFBbGpLNzZleC8vbmZ0dmRJSWxzVk1jbHJOcnNFY3Rw?=
 =?utf-8?B?T1gzY01Kd3JGNGpNc3dtOTI4Lzhmb3lPMDR4d2pkNTlUbHNuZWJueUhBdmc2?=
 =?utf-8?B?alNGYWRiR3UrQ2FvTlVYbHEramJBWHVkVDFwUFFVa0hZRml4TlcycXVKcStz?=
 =?utf-8?B?dWxYM3JhbWJ6SXZ2Rm5KRWtqZ1MrZnJGUmtGWm9SdEZYTlJLcUFiSXo2RFFj?=
 =?utf-8?B?NVlXZk5yaFFkZmNyTHh3SEVXbFpYVVlaWHRKV3FnV3RrRlF1RmpmZkFXTWVw?=
 =?utf-8?B?RzV2VW9sTzZCN2dENUNweVNUM0IveXp4d0gxa0pTK0hnNk1CbFlnVWp0NE1t?=
 =?utf-8?B?Tnd3R3ZUVVNpY01rTTVCaHI4RzZGZzNSNGVJd2g1USsvVHdmZ1BWNXI4MWZV?=
 =?utf-8?B?RFJ0Z1NRTTI3M0NqNlBlcTMwOHdGTW12bGdKeU1nUVlyTHZTc3hReUs0TjNo?=
 =?utf-8?B?aEZOZlJKQjAwd2laNEcwbElkSlB0cEF1UHZWT3QyQUEzbFVMOWZYV25kOCtD?=
 =?utf-8?B?N2tic2dlczByaTNYT0dpcXJQOWoyV0dYTklHSFp5dUZKWHhLVzdhSlowZDNv?=
 =?utf-8?B?ZURiL2tpeVNKMGxGYmJOZVAzUEdQZmNsT0czeEZXb05XRElEU3RJR09GQkpa?=
 =?utf-8?B?c0pTREg1bDN5QWdlWHQ4M1lteDFZZXBQdXdaMnU5M2RIS3R3NDRWK2kzYzI4?=
 =?utf-8?B?Q09oVFBLdmYvcVZIWDRCbkZIclUvUXgreGk3Qk1mSHgrWCt5VUdzdktSVkxq?=
 =?utf-8?B?VVZlZWN6aCt1MXNlSEQ0R0ZGaHZHUUhONDhweHVpNlhRL1NCMDhmQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f0abe0-bec9-4f91-9379-08df464748a0
X-MS-Exchange-CrossTenant-AuthSource: FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:28.6049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5HDsOl9XAznSKxRYk/NtilnLRTMhTX9crgu+O0H8RILcxem0Qe0ig8MkF33EhXErYHYwj9C3qbAyihHBysavA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3631

Hi,

On 19/11/2026 2:23 pm, Yunseong Kim wrote:
> Hi,
> 
> After https://github.com/llvm/llvm-project/pull/180955 feature
> "[clang] Add check in SemaChecking for multiple unsequenced volatile accesses",
> v7.4-rc2 kernel compiling with the upstream LLVM 24 was failed.
> 
>   kernel/sched/build_utility.c:86:
>   kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced-volatile]
>    1998 |                 .last_balance           = jiffies,
>         |                                           ~~~~~~~
>    1999 |                 .balance_interval       = sd_weight,
>    2000 |
>    2001 |                 /* 50% success rate */
>    2002 |                 .newidle_call           = 512,
>    2003 |                 .newidle_success        = 256,
>    2004 |                 .newidle_ratio          = 512,
>    2005 |                 .newidle_stamp          = now,
>    2006 |
>    2007 |                 .max_newidle_lb_cost    = 0,
>    2008 |                 .last_decay_max_lb_cost = jiffies,
>         |                                           ^
>   1 error generated.
> 
> 
> Is that mean topology code have a potential issue, or is this a compiler's
> false positive? The same error message can be reproduced on the example
> user space program.


I didn't realize there was already a patch in progress.

  https://github.com/ClangBuiltLinux/linux/issues/2190

  https://lore.kernel.org/20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org/


Many thanks!

Best regards,
Yunseong

