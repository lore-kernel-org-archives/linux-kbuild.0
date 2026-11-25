Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795621170;
	b=xzqwryV7DlA0puglJGZGlgOA/FIItFFJOyL645AsBnio7+zG7sLAKQZTcTUQM7mqomHZ
	 FFn3k9PxbAxtqh+oui8vYXG5/oCFUtE7cn7ZLf36GJZYCdoDv11IeaYh0T3rhCqJQGxcH
	 d5OsWzoQBOYAkZ8IFFDj+VEF+B8EGXP2/SJvacUaPH63JZ5KUKTAx577WdZIqIllujaL2
	 VswcqiOZbUv+NieVzIhCwg5ZX4KllwgVoIDmZTGIywPUc10M/swhvsUqJ7PM3Tl075Yne
	 I4kCynphMoQewNnIVOpH+Z8Hd8VwIluv01JrTpNsnbHfhIOtU6cBsfyy6GQoa9DDXxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621170;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=5kow55TRMPg+xkZkpdjIBqZ0GvYFkCqP8nzphSGEhmI=;
	b=0K3TSGcmiPwnY4zal2g8YZApaH393U1e5PAysPd5Vn0AFhIVqjoFPOdb6SCgPVTfkU74
	 z4JrSDTKxkU6UYpTCheZshHUd0jngBFrSf8fpgyHuaWQfQdUeqDSvU1z8lEYk7fMpbXJU
	 fzAWspSqwA5j/QVQCh5G3pxo1IJJ19RwzNoxDFXvCO0zmeZRw+G9w2VfP2PAMvVnC4G+P
	 Ye0upP9yvWzrl/rKQiRUOVbuILYZoWad3kdLLVA+ksycDG/CQrljbIIyhglCtx24X9apX
	 95VjfUatCp5aCLXbrA8V+imf2TlYC15vafodmDbUsegbjHxxJVfS+Oxcv5uvQDDnf+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b="q/1QeMGH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.86
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021086.outbound.protection.outlook.com [52.101.100.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF669606A6A1;
	Wed, 25 Nov 2026 15:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF669606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=q/1QeMGH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddeb+e5hSRpNSZcBQNMOiDzBXhRJy2Dxp3w6ufXTSG0KgBJU32DFCGj0FDye/eE+UPRsFO2wTtWREe7sYDMh/OmI4KRNmf+wx+UDV8tmTgMFcc3lmp7WH1EammjyFtyvQCA7nOsJBEt7k82lR7+wJmjbDptbx8MtkTWgY4Ar2qzQ/9cXH2Ouc/1ZNI3qj/lES0Wir+34rs45vikN9iEKrXJGySnTfiJBmUFeNYIzMFahs2YyvksiFO4HyF5uAc857tNYeOgcTX/ap5hIiFPGDpmEu+RM9i8bNVfpXFRvaUtqx+vVKxm6ge3Sb6JxZqfbqjQtohgwjqtZ4EsFNyXXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kow55TRMPg+xkZkpdjIBqZ0GvYFkCqP8nzphSGEhmI=;
 b=d2vl2oGV8urbd9332KR48F+e2kbmGN9D4+tL6smTIHMiKzLXUYkHOa/TjOUFd81aYtuHBbgyvxPNv+nEqL0TV8a5O1wkt7PX7IXUVO2VfQWvXgAqLaFF11iUFdOMgbg9ZC0dp9zguLR2zuQ68MAhIdPSLBb9PMMJFHNfZsd4viayrVrD4IrK64CeqDBENp6AzhIKGi6ZJcUWo5l3s6AJNzpmZxban1L4igEoo9NxRjEhmVcUgZ9Bpg4k6BBHEOzYNJqTTzwIfR6DQxrlrdV/SGoZLZuvzhvZPN7y92icOPGUuhVR6hGMESgA81Ec8ynwuW8+rzpdY+oyGhKM2C5wfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kow55TRMPg+xkZkpdjIBqZ0GvYFkCqP8nzphSGEhmI=;
 b=q/1QeMGHZ02Ko44fyzRsjhYye1NZWqq41q3ivE64q33WN/+pzFPflaIO04nE1oVnHjHVmFc1pXDZybUed86h3s5A0r+7JEFX/CbRIGnqhPURnpGz1nfeKMxWQ/rfmxM1TtpQP1Yd2FUiEtppEAKT8gc0ZUUEi/bQchEvMl4J3Dg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CW1P265MB8958.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:279::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 15:39:26 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 15:39:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 15:39:25 +0000
Message-Id: <DN4EKVFD8CH8.3T0EBPKGR2LEX@garyguo.net>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: rust: drop the obsolete libclang stack-init
 probe
From: "Gary Guo" <gary@garyguo.net>
To: <peder.bergan@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261125-perf-rust-bindgen-drop-legacy-clang-v1-1-dafbf8d4d3df@gmail.com>
In-Reply-To: <20261125-perf-rust-bindgen-drop-legacy-clang-v1-1-dafbf8d4d3df@gmail.com>
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CW1P265MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: d37fe104-0eee-4262-2a23-08df4b0a48f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|23010399003|10067099003|56012099006|261022105027099003|261022075727099003|261021123027099003|261028144727099003|261021121427099003|261026140227099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	YRbt8mW/cgMAjYGzkGhBZVz7fw/D403sl5xON6MG9hcR95NUg0TJCJD/YcMMOn9kK/bNhXocDEtdmU7eRHR27VqnfWwa1QQgCfZkpTTxU8Jgi10YFTt6jHHZd7MnN5MFU7TIw9X0dACN/OTzP98/CkSav24zRqSOhX+GAskf4wfcTgJut0DdTsIT+pqa5hjyKa4k6DLEkdD+6WYwb4viPAWAMuW1b0C59VYBdyLw83G2umAEvTYW1ktMC/0ulVCajQbQJz+J4krIRnodxj1skzpwGoHgIcdd0e/C1IERrRBGVU9XmOrlbVOFFrXjp/grl88D8qE+/tos+0ai5L3CTIBnT/VxrmcgshKOgwAtFRphf5fFvmgJKL8lu+r2mqVreot2I5ktwwKMx9XN4IvNMHUy/W/qp3tZFDY1euK1RNv6Eofs96sCMNTkHO+J9zIZVpg4mkHraRWfdueDIi6nxhUZQ903ZsIpP1mLedk0TnjGYqlEgV1xpCj3TmwxfcZrg6gjKiJBPmKYdl5Mw++FGU755GacecnKYphi9AOSZnlmCF5seK8i99q6NiLa8xuikx3A78Eo8amIRDX49ns3q6C6ifnsXEYnMm2b8IwDSSgGAQEvl1cYRem/9L5dV3GpqCbNTv1bUAlCvi5KlEnDXbP3xKB5sXpwjNKStnbb2RY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTZWN0RzWi9TQWxrWGtrdVFSVUc5NW96c0Qzb3A4YndYczl6ZTdSRnQzQmM3?=
 =?utf-8?B?T3NMMUR4S0E0ckFKS2FlQWp0dFA5VjlTR1d6bEdkdWdBWWtBQ1QvN2FxbWQy?=
 =?utf-8?B?L1RWK0FZdkU1Vk54Ry84OWJVRmEwUU5zU1JMZm5ZNlhxV1Y3Z255VTFGOTFR?=
 =?utf-8?B?RHJoRUxZVXovMTV3TjBQOEt0UFdVb1RsSlhpT242WVdJMzRYWFVkQmhCSUZY?=
 =?utf-8?B?SGxsbmozU1JFTkpZR2dLVmxsaGVLZnJtU2V5VFh6K1QyS09oc1pFUXRBSHZQ?=
 =?utf-8?B?alg1K1J0VDlYRmVhT2g4T2xlc1Y5Y1F1cysvV096aVZRWG9nYjRWSUUrWGVz?=
 =?utf-8?B?cWJPQkdDbkJ6bWM3WkQ3cWtYOEczVTlSbzlIRmY1aWZvWmtXdG5XZm4xMHJT?=
 =?utf-8?B?eThzSDIzL1dna1FRSW16YVBkanh0WElHMGFDeXo4L01SQ0hTMy9BVlZoelhp?=
 =?utf-8?B?TTNmV1lGVXFPNHA1Nk1RNUVtT0FwMjJSM3l1LzcwaUhObFVwcWhXWDNvZ0Mz?=
 =?utf-8?B?YzJJcHllRHV4aE1hVzhqZ1hXL2tBVVltYTdZOUNCczdObHk5cy9pSUxaYjlK?=
 =?utf-8?B?TXBRU3U4Ykc5WXgxemVmbHBtV1NtM1IxMHdwUGdEeHIyOGZXSUh3NERjQW5I?=
 =?utf-8?B?anp3bkxPUzFOU3lQaHAxZEg5RG1hUDBXcDYwaHRxWmZFdVoyYkdpbEI5ekN6?=
 =?utf-8?B?REVUNTdWYkJVSVhvL1d6aUlwWjlPZ3Q4WEVhNHN2Y1h0bU9kY21vTG4yUzl4?=
 =?utf-8?B?aFA5OGJWWW5ObWs5NS80NzN0dWprNHZscGVleEoyWlpDanNvOHovMHM5WWZw?=
 =?utf-8?B?SEpvcDljd1NSTHZPaTVVd3E3MlZXazlxZkROcU9SNFBiQjc1ZThqd3YzeU9H?=
 =?utf-8?B?bTNHNkZBOW5DN1BRU2NMajJqVXJoTmNUNUxZQTl6TzJzVHBvWFhHRkxoaHVo?=
 =?utf-8?B?Y2gzTW8wUXhGV2l0Q0gwNjRqRlZVUC9ERVgwZ2VUa0YrNGtmZ2lheThneE5K?=
 =?utf-8?B?cnltaEs3TGNnek5JWFRndGtiWDFJYlN0Z3B0dWpUMlpQbW9pVmcrSXZSbDVQ?=
 =?utf-8?B?UGp6Z3JuZnFvaDR4aHYxOXFhM2RiUVVmNnlKZE9NdzY4cDh5TVJKZy8yM1dm?=
 =?utf-8?B?UEdXNXZJOHVzZFJtTDhwMm1oUEtNM1lVTTBUYTZVeHMybU1zNzdjV1ZrbVFV?=
 =?utf-8?B?dk5wdGFxWWFSM2U3M2phQ3VZVnEwRDBDWGR5T2dybU5jQ2JHVjlZTDhwbDhZ?=
 =?utf-8?B?Q2VWeTg3akJnSGFmVnZSRXAxZUZyLzRLMjMyMjErQmVBN2VwVHg0cVVoYzJi?=
 =?utf-8?B?Z1hvZGsxL3ptZlExT2FENGdTREp5NUNWTXc1SlQvN2NXaFc1NFF6U3Y1Q3RR?=
 =?utf-8?B?cGg3UG45VG9wOEJEeHJ2M1ZyNU45RjJNVytqU28zdHNnY2JzU0ZNTUYrcTY1?=
 =?utf-8?B?b0szeWhzdnplcUZOaWVZSE9GZEZCUEpGSE1uVUZMMGRjY29iNWpkOHc4bkJC?=
 =?utf-8?B?UFlPbVB2K2h5aDBFWW14bVJWZjVZdm5RWEZwaENjMng2dURBc3NXY0R4Kzl1?=
 =?utf-8?B?Y1hkZHRGM2dTVUVpMWh1SWRwUnA3VWJtSk9Gem9LemxVZyt0dkRrdkJrVTlI?=
 =?utf-8?B?SkVtM3dlNlFhVFR0SlBxSjJ5Zi81TzRma2F2TnpuMlQ3RkdmNW4zM1VTTk92?=
 =?utf-8?B?Wno0d3RyTUE5ZEJ0bDN2TWppTmwwN1BPMHVuWnN0QjB6ZjRrTXdVN2RlakVF?=
 =?utf-8?B?N2ZZTTZsdFk2Wi9CdDRIeXdDZzh0QVZOUENzTnFGd2RMOXRnY1FweTU0TVdW?=
 =?utf-8?B?WFU4M2R3UXlYRUxiUnBJSFUzVU1KTzVqd05tT0pnTGNnS2N6L3VDQWdaSGtV?=
 =?utf-8?B?dWl1ZFBOeHgwa1Fqa3dQZ3BMTEhiaHJjVC9zK25HOUJlb0YwWjBmZXdBS25v?=
 =?utf-8?B?cE5XZ0RnbzdCTHR2NkZXdU9KL29SajlvQ0ZEZWJJNTZDTjV0R0xwYVBZSm5u?=
 =?utf-8?B?Q2ZZZHlYQUJMNERqL3huTTJKNFZwZUtiNjRPN2ZJeU5xZ3dEK3dVejZIM1pi?=
 =?utf-8?B?WEdTM2ZWeEJ4RFZONEwvY3RSb1k4RE9UbVdUSVRlaTlkeFIyWEtEU04zQU5V?=
 =?utf-8?B?a2NqTXM3SUFHaVAyMkJaWjBnYUU3TEwxUHZpaVdVdmRPRDJGdXVYWVRycngy?=
 =?utf-8?B?MVkxZEdzQXUwTHNyLzRta3BEaFhRU1IvMlZvMnNqYzRXclZ6R0NkNThGQ3RB?=
 =?utf-8?B?SlR0dStNbCsvbnVkOWpubmlDek9VbnNUSmxMMGROd0Nwb1owZlBnZHFhc2ph?=
 =?utf-8?B?eVFpeVJPc05WSEc5TjZIM1ZLTEVWVmFNa2JweDQ2U0MyZFpoTi9Rdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d37fe104-0eee-4262-2a23-08df4b0a48f8
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 15:39:25.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9jUAq6STiEypgQ0cUuLQQ0jzA7wh/TENpmO9H6UcXlxTB6YsP5eJ2WoVZ9vx/o9ENT/GdusR5el6keKbVwokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8958

On Wed Nov 25, 2026 at 10:32 AM GMT, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
>
> For Rust-enabled GCC builds with CONFIG_INIT_STACK_ALL_ZERO, the Rust
> Makefile runs bindgen to check whether libclang needs the old enabler
> for -ftrivial-auto-var-init=3Dzero. LLVM 16 made the flag usable on its o=
wn,
> and the Rust toolchain check already requires libclang 17.0.1 or newer
> (18.0.0 on LoongArch).
>
> Drop the obsolete enabler and the bindgen invocation that selects it.
> On this rust-next base, median warm make prepare time fell from 0.72 s
> to 0.49 s over ten runs per version on x86-64 with GCC 16.2.1, libclang
> 23.1.5 and bindgen 0.73.2. For both GCC and Clang, the generated kernel,
> helper and UAPI bindings matched byte for byte before and after the
> change.
>
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Link: https://github.com/llvm/llvm-project/issues/44842
Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> OpenAI Codex assisted with coding and testing.
> ---
>  rust/Makefile | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 6dceabbf02c87..66b06ad6f11df 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -483,20 +483,6 @@ BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
>  # some configurations, with new GCC versions, etc.
>  bindgen_extra_c_flags =3D -w --target=3D$(BINDGEN_TARGET)
> =20
> -# Auto variable zero-initialization requires an additional special optio=
n with
> -# clang that is going to be removed sometime in the future (likely in
> -# clang-18), so make sure to pass this option only if clang supports it
> -# (libclang major version < 16).
> -#
> -# https://github.com/llvm/llvm-project/issues/44842
> -# https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0-rc2/clang/doc=
s/ReleaseNotes.rst#deprecated-compiler-flags
> -ifdef CONFIG_INIT_STACK_ALL_ZERO
> -libclang_maj_ver=3D$(shell $(BINDGEN) $(srctree)/scripts/rust_is_availab=
le_bindgen_libclang.h 2>&1 | sed -ne 's/.*clang version \([0-9]*\).*/\1/p')
> -ifeq ($(shell expr $(libclang_maj_ver) \< 16), 1)
> -bindgen_extra_c_flags +=3D -enable-trivial-auto-var-init-zero-knowing-it=
-will-be-removed-from-clang
> -endif
> -endif
> -
>  bindgen_c_flags =3D $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
>  	$(bindgen_extra_c_flags)
>  endif
>
> ---
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
> change-id: 20261125-perf-rust-bindgen-drop-legacy-clang-149a05cc71a9
>
> Best regards,
> -- =20
> Peder Bergan <peder.bergan@gmail.com>


