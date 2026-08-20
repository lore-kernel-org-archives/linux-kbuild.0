Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022090.outbound.protection.outlook.com [52.101.101.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AB4772AB;
	Thu, 20 Aug 2026 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241501; cv=fail; b=UqnD1PGrG88lt+JgLjqQeXx3i707nSEqUhqagRVmPPO70awPHZ9K4H6rik0ZVHCKiLDsbsy+SaHgt4KIZcar+e1K633uSu8dfmQ/UGQ6OtM6LhopB145t7YNX9jlDg1LW0nTFSW1KvezruDJd4ZalIrJZCMqkOAKzgyAsroNix4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241501; c=relaxed/simple;
	bh=YP1iU0BqsSe4WttVh/5p+Y74BbiFRYg8oiRc4a8ipEo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=X144K4grgrrAa5fNTJml0D+lhz/K8GzTMUOK4Vwd3KA6BPLtPMfZrJldWKBuP9PCdyKIpsDgyVPc2O5gMdEoC1/2dujFGbhLDPKUiACvx/m6WLuy4pBDYVcE6ATvh8NvvcLmgTHeJy6uwmzZkHO+zK3xRDgcyAa7nlUPVD1kVwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=elCJu5np; arc=fail smtp.client-ip=52.101.101.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="elCJu5np"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+vQO1aUisnlojB/grlPDSiXWu7VJjDeKzu+2BoyU/RFPuKvB9nDYW7Z8wv2cgTAj9J+ZJXvAJxmv7hmsUElZ7zCyefvhSg0R8iH2TV/3KC3N8dcmGkuvRsMJsQGmnJz7qVgHIQ7iS77xyV6boQ/E4frRBknUPhJgNP4oBy4nGYNFnkmtnezzgloj0Jfr7KA4wF2VGQtJ2Gju4RIRbJtt/ulXVSvOPvaJtWX5VA0Xm90o5mgcrAr4xu4bMk7LtW3jkR87XDFBZx0pj87CBLcQIAWVE/KE3F218E/eJRHxj6y+wS7GlCe0ukZNkj/dRo8A6W/4f8FheL+FkeTIcBZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOzIyDG4rtt+IlNhbB/k1sscxpg8VYPavTMtk2/rZec=;
 b=YO+CQu3LMCbcD8svfk4ukHYVdr09v4/STa6eN5XM9HXbAHp/e7s+aj9GvIC7fGxIaRgYAOR3rLGYEENIDqfjcvLIAOssoi9K/wQ6PkE8IalMRpu02gHY/f0mA0EEfmbBL1bArmkbjoTdw/GMZIuhZl/IdHiNkttlhN+EqYV6MdPBjL9NBAll/7P/Ji6Qxch2irUfZQcRQmLYGTbggmLkz1TsJNNpbytW5XzXLMmIZw89nzkiwf2R7J0pwQ8RbZ6UO/BEt1C2B97S9v7+hXalGYScOBnfXhsgUwwXWdFCy598GS8Sw0CN38degZ09znnl3+VcdPzgj1nUx/AG+hskbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOzIyDG4rtt+IlNhbB/k1sscxpg8VYPavTMtk2/rZec=;
 b=elCJu5npisbjje354TjtFxWgZKx4NO1CjoJnEz4cwuqVDfdClMl4Eqc3q2ZN4Fwl8MGvNWD0dAw6ni5qulOrcESHIp1cN/cnYNLJ2OTbAoPh8vM+0kXG3h6jP0Z67TC4UdhaI4ji5RADhCeswY13wQuPD7blPY49B/+4nx1gprQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOBP265MB8413.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:470::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:58:14 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 15:58:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 16:58:12 +0100
Message-Id: <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
Cc: "kernel test robot" <yi1.lai@intel.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>
X-Mailer: aerc 0.22.0
References: <20260820135733.37121-1-gary@kernel.org>
In-Reply-To: <20260820135733.37121-1-gary@kernel.org>
X-ClientProxiedBy: AM0PR02CA0129.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::26) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOBP265MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 39878556-ed5f-48b2-17ef-08defed3d78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003|5023799004|921020;
X-Microsoft-Antispam-Message-Info:
	4slR04GR3lImmnZzSV39zBj1f3iJRTD5DIXpWQgqmBT6ivAscXNTFP0G3oypjsiHMNMwo8zmWCE2UDY0g8O4npwXxZqb15tX+3PyfXoj1WCrXi095KLL07SSZNPlPSs588H1gD4k6ZxNvgtvu39Skk70ZbOTuX80lo3T7PdfWjCe/V34TveZxAcEjNuHROZzWAFH/yxpMgpOGkStpHWRxp2Mw4xLnV2Wp0PUjb6J+3pexUYathDBjfIiTenO/h0uS47YCzGAc+B7eB92XmHpFslkZBvnVaZ9/qKW5d1vpwtg7kSwEhOFoBxpPS1vlfadxNr6wKQlw6Lx74i41fJQswwrNgeQX2UyryMTAE15FoFzMLDn5Uoe5E46yo06yoXoiZLv5NrBiEJuzSaPRZrZd/irc+a14Qz+K6SJ0rFrGWxL9ykcbyWCVPj9kuvPsd5EUIAuHG4wzymYvieJv1tRdU/WNTfRCE1GMdO7k7RTBO486fK2NSANFDYkNnsvJ23e2AaYILxxK6fa3tBF4UvQQGReZcbyZivv81rVnMMR7+63RkLxa7jST4OUnFb+Ighc3xRl0BmWYMO5p8MAPxfd4mqigJbToXdLk3Mvlat7xnz3BsMu0p8URpw69mIXMfVmmnDN+9dozaZrjBqTrJXEYkzp+ReuA//IoKtRJDetHvbnBKGibsXSVcRHnig2NmZjiWouW/1GN0g27es0ZNowWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(5023799004)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDVmbEJXZXcvN0ZQK1lVNkVYQzEySzNMUUZmWndYZjdzY0l0OUYvdElKYkh5?=
 =?utf-8?B?emgxMmdnSVVmSGw0S3FodEg4aW9VY1BPL0NsbmRVUlFaMWVNcEp5bmNjbWF3?=
 =?utf-8?B?T2VWV2I4SDZua3NMT0VrTUZhODR6Mkl3ZzdtSm0xR2FRQUhiYkM1VVdjOEs5?=
 =?utf-8?B?SEEzcEtCNExObmFLNDlvK2ZiYlhJZzM1SUJWekowV2hxaGJWSktFMlh5YWs1?=
 =?utf-8?B?bG5QZmFCK24zV2dtL09LcHdrZXpoeUwyeG9SZTREcW9TaFl6bzR1WVBQZ1ov?=
 =?utf-8?B?ZVFrZWVHOSszb1p1NmxCeVRQVHExNDRodnRaemsxRVhoWVpkTGJVamxmL2JL?=
 =?utf-8?B?cm5zVWpHOFpVNk5sRC9HOW55ZCt0WWFHUkpoK1N2UllNaks1eS94aVN5NHVF?=
 =?utf-8?B?SE9rdU10ekFwTkxhRXZYN0VkOFJqODY0MDhqdU9idGJhTC92b204eE1vdTVF?=
 =?utf-8?B?bzhHQUtiR2RRRTVsOVhLUVZmSFcyVFRVUnYyRkRsdUcvN1daNzhDU2xhakhK?=
 =?utf-8?B?NEp4QUUzRlFtWEgvN3FFRlVuVWx2b1U4U0JWb0ZPSFVLNnE3U3FjR1UvNHlV?=
 =?utf-8?B?M1F2TUxJRHhhMHpSOFpTNFdZMWFVYU10c3p0VkpqVEFyMndEWXBwelFPcHpp?=
 =?utf-8?B?R3JRL3VCNXUvR2prenMxWGRZSTBlYnlFSlVwZ1VKSXRsc2hZZStKNUVVbGZp?=
 =?utf-8?B?V1o2NElaQXhHSEJUd1kveFVkTFBVMjZIR01iNEcxanhqbmppUXZheVJVQ0tp?=
 =?utf-8?B?MUM2aVQxbHQ3R3E2aStITXpFeFFjMlgxQU1GaFJ4bnR2aXBQRW5EUUFlMS9p?=
 =?utf-8?B?SUhISWlKOVIzRWZ5VVI3bmhTM2QwOXUzbVpoTWJ1enFZSmRZdStOeWZ5SUFx?=
 =?utf-8?B?L283bXJZTjlWNkZEMVJROEQvOXNoMGVSQlh2WTFDSkNiRmI2SXdtalhRZkox?=
 =?utf-8?B?dHBMOVo5OHZCVkFXYUtjK3FuSDgvM3F2QmFwNDYzNjRicWw2WGg2QktNdzhw?=
 =?utf-8?B?NTZpZlZkNXlWTTVlSTErODF4MUZ2dW9QaEhYRHBTVUlYZEhtamtEdmlLL1JX?=
 =?utf-8?B?dXZHbHlRYXBtcm1oUGl4SFJBK2VHUUk1ZFFBSFZWdGhieUthVUpSWlRXOHJQ?=
 =?utf-8?B?ZU9GMmxTNmt6bnRjbjNnTmtkRGE1dHk2TVBxQnhWOXdPd094T00rbWUxaW56?=
 =?utf-8?B?Q2JKNkdpRHRMMDIxNEd2RVVEQ2ZkSE1telVNTWI4WWdvMUt5SVlkZ0NxNGRG?=
 =?utf-8?B?UDdiVlVmcXFZOFZ6eURaTVRBRnJZRlY3TmFzQU5hamg5UllNT3phVld4WWkz?=
 =?utf-8?B?U2U0eDNVU2Zac0RCbjhHczZBUGExbzdQck1uSlNyM0htOFZlakw5R3ZHUmxm?=
 =?utf-8?B?UEtYRWNqSTVEUWtTa0VpU2VtRUJucEFmS3dJUER0S1RpK21xRkNKckhvMCtX?=
 =?utf-8?B?WWxJdXNiRjNJeC8zNDl4L1BaS2NtSDlVZG9zKzhERllJcm1xNDFmaUtNNkt4?=
 =?utf-8?B?SlMvbzRmaThGSGU1S2NISHFlbjlKOEZMdDA1aU1JTjFvdXFBSGpwcE9ldXp0?=
 =?utf-8?B?amhiSkNOSFVMazA2MTYxa1RDUnNVV3dNd1gra2Q5UXBSVzJja2tEV21zbTQv?=
 =?utf-8?B?V3FncnVXSWh3emt3SVQyRDZYaDFMRWY2MTMxTDhUUlVWMVRYMG45K1JQd0tU?=
 =?utf-8?B?am5ab0pxd1N6TzVhOStiL1FqeXQvWUVibTVJbmRIazZBS09VcUE2KzBPamsz?=
 =?utf-8?B?R1cvVXhraDRvS2owYTF3RlBDSlo2UURPMmQ1OW1pVDcveGV0UjRDRXoxUmRT?=
 =?utf-8?B?QTdRN0l5MHBna2NINjF4QjR6NndTMFdLR2oxVGh3REQrY2ZXNjlsZUdMY0Zs?=
 =?utf-8?B?MndmWFVEazEvWVNlNzM0S1kzek01WTlzSFBUMWVrTVQyYWtQeW9DRXhmMGFF?=
 =?utf-8?B?aFZkSXJSN29ZNmdraENHWEw1SE5tUGVnQi9sM1NOeE1zTnBsRzlIdUpZUlRs?=
 =?utf-8?B?V3NhT1UrdTFTclRhQlBoZXk0bDhnQmFlajVseE5SWU9heC8xRFZKS0JuUWpk?=
 =?utf-8?B?RmdRV2dCU2hvZC9TTkdCNXg5UHR2Y2lGRkNXZitoZnRybDFHNW9xU3ZNdjl3?=
 =?utf-8?B?NHNMaHNJOGlqTVNmcjN4NmVZaVNDTmJhVGYxNmdyVjNWMTcrTG1Yc0JrL25p?=
 =?utf-8?B?bUpTUndqQTJ3SXhBV01WQ2ZzTlArbkkxalU1ZHBsWmxKVzNtRk01SFdoSnIy?=
 =?utf-8?B?bmZJWnVmZnpoWEFORFdsTHNMbDVJTk1yR2xTVnRrVFREUVA3bGdUUFhTbnJj?=
 =?utf-8?B?M1BLdEdHSlloUmtWY3E2L0N3VnZxUFQ1cFczcFkzTHE3Y1lBM0Q1QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 39878556-ed5f-48b2-17ef-08defed3d78e
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:58:14.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lst7LQ5IaRY7K6ZCTytAECc17PPf7WBW4DoLlFrirrlNEGkrZk4ax+3T+nel7f366m5MWsylYIELIuFGyNIYpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8413

On Thu Aug 20, 2026 at 2:57 PM BST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> In Rust doc tests, there is a dummy `__module_firmware_test_init` functio=
n
> generated by the example in `module_firmware!`'s documentation, which jus=
t
> returns zero. Many other documentation generates function that produces
> zero. LKP test robot reports a `Flags::zeroed` instance; my local
> reproduction has a `Bounded::new::<0>`.
>
> LLVM's MergeFunctionsPass incorrectly merge functions with the same KCFI

This should read "with different KCFI type" (obviously).

Best,
Gary

> type, causing `__module_firmware_test_init` being merged into one of the
> zero-returning function. As module init is invoked via indirect function
> call, KCFI is checked and this produces a KCFI failure.
>
> I've reported this bug to upstream LLVM [1]; in the mean time, disable
> function merging if CFI is enabled. No separate treatment is needed for
> CONFIG_RUST_INLINE_HELPERS, as Clang does not enable function merging by
> default.
>
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202608201017.100a4511-lkp@intel.co=
m
> Link: https://github.com/llvm/llvm-project/issues/217629 [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 4fee5ee9e9f4..0dd9a6eda739 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1118,7 +1118,8 @@ endif
>  ifdef CONFIG_RUST
>  	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST selects
>  	# CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> -	RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normalize-int=
egers
> +	# Disable function merging as LLVM incorrectly merge functions with the=
 same KCFI type.
> +	RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normalize-int=
egers -Zmerge-functions=3Ddisabled
>  	KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
>  	export RUSTC_FLAGS_CFI
>  endif
>
> base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d


