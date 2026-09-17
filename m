Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041AB4DD3DB;
	Thu, 17 Sep 2026 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646338; cv=fail; b=JKritWwlKzjdWU1YoO9jn7utzl3LGv4aCZ1hLsBzQrkbFmWipdNI32uR9i8yuKGYYVDJlXHYrpYB43xysvg9gaca+1TWbl63eLIRKP0bA3TLU3dDipJxCzt2JGmFs3HqqmeY6woPVUO56uaUU1F/yRjw3D8BIlMQEbQFO9Hcui4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646338; c=relaxed/simple;
	bh=TEgDgCeAap3XVZYMyTNA0+ON8CWCOfG2d56OaRdbyHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZTgXj9cgSFcIHgWMVkGVAn1cY9gfPIWm6TSRwK7+iuniit3PPGCFGA8jsGYy6FM4e5/ktvNxZ0tNflo8wIATe/Jsp53GF2anOxyMUSYzIAcWurtCy1S3a+R1N5OPgjXpYn/oFdktxipjpdTeHBHek/6eC0ewrwrFofWDinvueDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YVH6sHO3; arc=fail smtp.client-ip=40.93.198.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YVH6sHO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw4Gxxj8am18bifF7WzRpc/MQFkocHWO3SiMbydDGiiRKLM82c6+14cLLQXukA9wF3yd5II059MWsh8tz/uL2V8pYj93Aq8wdEwgeUrVvcXYR+rI4vMyzBuyI8JktzYj9GuZdF+LzX4vfnFN6RAN4CyGk7APUzEx9yKeodbJgBr48u5kEe/FCSZNBJep2kC6OHP+A0CrVhLKQmUoeek3aIGCXV2+WWtXhikNvoft38gNGN2xeRCNvd0jNtCNoI+v8SQPZHgw6NWLz8N2Yy91TYT3e5mfN6jI+p0u9inyOOQrtE01qi5QBccxhoe6T3D2CsucEzhJtLLYP7+pZoHptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuKSgja1eQ9iPTlTZbxOxlbQm9wGkwMeOV7fyz4gbY8=;
 b=byGeCC0D0OBEidpYifCyM2Hgy7bPjY5aWGWqu/xHCSfICAK68ofV35tmmEwy1MGPySuVzYL0EQuuoMVc83hc2CiLHZV/Gn+15hBkecrTqacjw+jbYNCMVTk1ZMsyQ8SjDgC0bNklogd6mAQHtKqJ672WZr6mzMeqwAHtgQ2jstmkYyS4K/J4PMZb3yf8RiJTmh0MMiU1lbRS4J4/+ZcW1PxYTwvX2UnZ5z+AMzVasA1j9jmaIXod8n4t4Ispes6rQxZeQ10aCePl0CmVI0SBgF+JEKihjoCS/Vk66Dj/3WYy6p+w2fVapIv1crpuVW4q6vi5HbhwPOi+9pc5EjAyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuKSgja1eQ9iPTlTZbxOxlbQm9wGkwMeOV7fyz4gbY8=;
 b=YVH6sHO3NFSW7Jdwweet/T0gz4L0+OAC4b3o/340Rk2YP7c8xZYTeeBVnmEKPGlvzUiV9qj66sJ/nviiAp02434BnLlOw3uLYpR5UbXXXGRsNoWNVo9L8DGCFbk+7ZW3wboS8yJCoWuDLpxBOFNpKuIfoa5JrECJAQ+15gAnMOREy0Yagalom0zHV77YH7kmEGuTjkeyHl0Up8FJ7K6dSOQqGfBvtv5iADFWGjIse3+LQrCFL6TjyS2pqzJ2oL8BC+CnNvJeWw/hxOOhgbPlVydcUj9swSIgcnTno9tDLDVi49XTqOcFZCVBpmemAWSExcU7VnOrHvDq9yEzOpwnVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV2PR12MB5895.namprd12.prod.outlook.com
 (2603:10b6:408:173::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 11:58:44 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 11:58:43 +0000
Date: Thu, 17 Sep 2026 08:58:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
Message-ID: <20260917115843.GX3968357@nvidia.com>
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
 <20260916231319.GA550816@ax162>
 <71a8b988-3977-44e4-93d6-782e4447f160@t-8ch.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71a8b988-3977-44e4-93d6-782e4447f160@t-8ch.de>
X-ClientProxiedBy: YT3PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::35) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV2PR12MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ec9b3b-0f6e-4d99-20af-08df14b305ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	45BNuMz2cBFhWDNr5kgT7Gq8WrajjbT2rlndc2wnzB3kp79nl9r9uMiBp+B2DEhcNhEEvjWHNcb3SjZnudcPDDWHhxMYDVz0GSRZcKGyAIstuxjEuJ00fQJQNqN2r0rVJEGUGtgNr+eM8qk3qGP9yIpe1TpfKA+sTpOgDhO61qimXZk5OTquwW4eoikrOZ38gvUP6/KvPCa387eWzNleEdrphi4kNUAugX+vSggM2n5Gc9fyXGJZ2j/UF6SwnPWE5OvL/blbEOh1xdsibIVGdWTGlCdcqBEwLQzCsaBeITAoX5av4KEHef1+FXRKc2sLCqdZB18nRlZS4NhAIY32jlw6ZuactfAHQSj1A64jEtukgyAHTk5kYPr5ooH55N2SNm2fCfRHHmdGSczUNBi96kJVC8KHcB1mX3Rpzdp8XrfmrFXYnEa5ong0mzHU8OqKUeFelWat1pyFWvkpORHCSphe/HnUqOyLbzAqDJ/2xRzY7LF8aDI2fBCcd7Ez3G11wSZPpRtkk6XoyK4sXr2yQdIAr3s2p0Gh6A5mEkBztmxa79s5kQMZHTCmPbcoQZUT+oOdXLD3O1zkSB6Ky/ButWIMpGXcWOH0BIJEIs2G4rKZyj4FUx6uhOW9ULppDhxZjQVwQyC7CTCpu+A/BVqmBXJTWcARVYCf555spwVP1Ek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um14WlFIdlpsVGhKMjd2WmovRTFTdmYvMWJ5V2d5citqT2M2bnc2MWdyU0Z5?=
 =?utf-8?B?VEQyc2NPaC9mYW1IUGdlK29ZeEUraU9MVzdqWUR3SU91bTl2N1U0VWNvWjZu?=
 =?utf-8?B?OUxqa0lOVk5Ta2VDUnJjWHRTVit0blVLT1c0YkpQSGdzRUdkRUVzS2J3OStu?=
 =?utf-8?B?L1RzYTVRakdUcXZheUxaVndtNFFNWldZcXYxbWFhZUNVbGdxZ1NvQ0Q1VUQ1?=
 =?utf-8?B?V0hzUEQxc1pyd3I1WWplbnFablN4emNSYVpFNWx1ekJ5a1Btbm8yZyt0a2tG?=
 =?utf-8?B?UWlIdlljU3RseFpuSm54bEdVNDBuTzBxcjlRaW5PbTBZaDRjZy94MzVsUEdO?=
 =?utf-8?B?eTBFSFMwV1NZYUJJa3hZb1I1bXRNVXhOVzRPbW1PSWdqOE5sM05DNWY2bFQx?=
 =?utf-8?B?TWJmV012RHR1Qmk1VmR3bHZSb1VJcTZuNnZQWjA2dkNqZWNsbjhROGhZK0xi?=
 =?utf-8?B?ajByVE9pVkYzdVY4SHEzd25OV3hndHNvK0d1ZC9NVlo1a1NOTnRMREZwYTVE?=
 =?utf-8?B?ZmVKSTI2V1RyRkY2RlBwMmxydVVzSmk2azlheXdGWHkxTnByb2ZjRmszTmlR?=
 =?utf-8?B?RHZLZTk5YUdoRW9oRkhQd01iZjhEekhqd29PdEwyRUphUTd0UGFyY1hWaHI3?=
 =?utf-8?B?M0FmM1dHbnB6bG1FSHNwSzlNdTZjQXFKSUFaOG9JU3hOQ2lUcjUybEs1cWpo?=
 =?utf-8?B?QldEWm5hc3dvMUY1K2RiSnVZcTRhNklIUWF4azY3QlVqS2YySW53V1hDanFr?=
 =?utf-8?B?YkcvWVpab0thQ3EzdzluTEo5aFlPSTZ3NmRJNFBNSjcxNENQbDBQUnJYbXUw?=
 =?utf-8?B?K1ZsNmVodHhZN1VmcWNvOUpxQUlFNVcyTVZDQnZFZVdzMnl0K3NvaStVOUVp?=
 =?utf-8?B?cTUyd3ZvM3JqVjFYV0YvNkJEakVzR25GMTU4M2Y3aVhwSmlKTUlBOS9RQTlS?=
 =?utf-8?B?eXYwWHdFN29vTG94UHY2K2RZSTEzWGg4QXBISDhqd2M2Qi9SZy90SURnRUlL?=
 =?utf-8?B?aE9rTDZPVU12US8wWEVvOVIrVWNyUzJyTDJ3MjJBTVpGMEVURmpVWVBxNzd1?=
 =?utf-8?B?aURjSTZOa0E0Y2NRZSthbFpycXdHL3kzQUptL05FQ0xORFJJMG51YnF5SUxO?=
 =?utf-8?B?ajRRZVUrYXBpUVF2SUs5M3lGbXVzNWl0Q3g1RXg3TEpVcEFmRzJPcTNYdTJz?=
 =?utf-8?B?bUN3Z2tyT0w2RU1FZ3YzRkNPc2pXMWNyZlpQZ0toSjhDOGo1QzBVK2d5Qk5h?=
 =?utf-8?B?dVdVclZ5ZjMxQ3V6R1k1ZExMdlpUU0tFUjlvRW0yRmtiTG9WRnMxMHdiWWFY?=
 =?utf-8?B?amY1Y0k0QTdIMXpoTW9kUmxvVGRSZ0JEN0tmb3duWW9VMXNrU0VmK2pBSmZk?=
 =?utf-8?B?SmdORFVQbFZINHIyWldzNzVJYUFYRzhtTUdzcmxya3d1cGkvQnBwSWtTUDBF?=
 =?utf-8?B?b2JwQ1ltSG9CTnpWZkFZcWNxbUU5aXJDbjVxNHFscGxXdzFPLzU5UmF0SGN1?=
 =?utf-8?B?eDRNWU9za0c0dGcrdVAxTFA0bmlpcnJOeHJsdVJEdGhLb1NOV1J4RVZ0YUlG?=
 =?utf-8?B?cEgwN01OdTMrbzNSelBKaW1FdFR2RlNSYWxnMDVrT21EbWc5VDF2dC9CaDVj?=
 =?utf-8?B?WElVWjNEV2hLbTVvbWhtK2hScGhDUTNOcjlEd3ArVUZPUzdkUjNUQ0d5MnJX?=
 =?utf-8?B?Z2lUSDQrdGpqNityT0hRSFNmRU9wRkRsR3VWM2hrcjJveHc1SmlMVkRKTnI2?=
 =?utf-8?B?ek1mYUE3Zmp2eGNpT2ladHg1bC9kQ0lzanlyUW1oMkhTa0FNS3pNaXRuWDN3?=
 =?utf-8?B?UEJNUHBKMDI1Z2UyY1MrSm8yR1llYVpSb3pIb012TERUMlA5U2FHVllZTmZ0?=
 =?utf-8?B?YllRWFpqaUFSL3RmUVE5bUJFSnJ1bjgvMS9IQ1BYeGZjQWpsMitIbkhtdk0w?=
 =?utf-8?B?MHpjT1AycWs3V1BzbEs1dFFHWUM3MWwwa2IwSXluZHFVZjVpbHk4a3g4SjJT?=
 =?utf-8?B?R2Q4anRiNUE4VTltU0YyTHRqZlUwVXEyRzB2WlR4V25IZzRNZ3NpRU9KdHRO?=
 =?utf-8?B?aVY0WEZzN3l2UFI0QnQrOWt5MFhITjdnWmNMTWl3TUhwRDB4VHk3bzVrZW54?=
 =?utf-8?B?bEdxcVlMczlXR2NxYzVHYkhHVVZkUVlxUGxaSitaQVYwQS82Z0o5c0llSVhF?=
 =?utf-8?B?SzVsMVQxWnRCTmpHb3hpRTJzaXZHWWRTNWdPT1RVbGlaVWNJK3RPQzh6UkNL?=
 =?utf-8?B?OHRoZkthOTFBR1NxOVVwUENUY1RDVEdjb0R2Uk9CMWpucU5GWG0zVi9yTDFV?=
 =?utf-8?Q?PA6NoQ2PL67jWgtAKJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ec9b3b-0f6e-4d99-20af-08df14b305ba
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:58:43.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EjehAJ+SOMt60a/wQY315R2UIJE8LfLrkfozNTWo1RLX/Px8OWrlN7yDTHx53Ok
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5895

On Thu, Sep 17, 2026 at 11:05:32AM +0200, Thomas Weißschuh wrote:
> For instance the example from above:
> 
> ./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
>    29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
>       |      ^~~~~~~~~~~~~~~
> ./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
>    34 |         __kernel_ulong_t __sec;
>       |         ^~~~~~~~~~~~~~~~
> 
> These are legitimate issues, the inclusion of the necessary header is
> gated behind #ifndef __KERNEL__ although it should not be.

Yeah, if the header is included by a kernel file then this makefile
test should evaluate it under those conditions, and it should still be
self-contained within the kernel environment.. Wasn't that one of the
problems with earlier draft that it did not figure out the right
compilation options for the context the header is included in?

FWIW I think this is a reasonable compromise too

Jason
