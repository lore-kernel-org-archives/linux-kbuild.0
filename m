Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC115746F;
	Tue, 15 Sep 2026 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430866; cv=fail; b=M2oVdSbbG39WZkuVMKm4qjexhtvq2l2xwZ5ntnMwbCMRwgUnvXy4m1hYZcuq3FH9eVe6WEg5mkOrWWOweWseE5krLOvIKuytVsGRXZuXim9qZb0Y57eb+Sjfdp0M2Jk+GNfDGi+6/PhzSFzreNyGsbgxnB7Sx5ZTpYgzOp5WOog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430866; c=relaxed/simple;
	bh=0zDKjRCRCqxmvxjpSBas4zpCfximBiEZwc6pE6zeE+c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dqjDFZqBkHLp6j1WyrdJ+TVQgobpb+dSTPzv9/OZrVf+VS1J0Apf+E5wSRQ0my8ETnCg2ozeSmTRp018ab/rZ1Mc1Iwypqnyl21SAbCvMJxXGoaJxIw6GJp89rv5p4tToGflduetSmVRC+uaNuMsEhq3VABT+qalqed3boHM50Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mee3t5nd; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mee3t5nd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=We14TIstiKgvgW9uJ/qx4HoeucdoaMDPDHezQBAeb/tAcvl0h5iV68JepGSf6DbCs48jLPog02ZaUT/lM4rvktnIqk7n1xHTCOCW14vKy9jKo0Jst+3du1zfgxaawlXm3kYpCTVX8oihLsmanrxEFw58FXo5jRqevAsOm6yw0TJ6yMPrNoU+2Iq6FCb0iea7VQmoWboMMffv2paiOvNGHFRKaH11AFnWidrSdhkwcRlHITbOvfMy3UtMoCt4Fck3IKr44k4LqhmTqXFtofqClhVSKMo7BZGjUwXzbBEGPkRB8KiIuwzkOs4r0EUrjgsuDSrnQqF2/TxntzBmWnUa0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RMhOxoqJtOaDIu18C0ThPBs4GrJeVPxabKxy7It78g=;
 b=CjlQc9Zus+E5t79fzxbymyEaeYvtfv83OWcz84p0sU6mvqNl7WWFxvuChFxtlVH+Jgcv1X7D5KyyYOHjwxjLT/fiLrVxZuvdOTWCvHzaUFVfIGLUuIaFHFT72f87kVotXwnyLURL7hQYhRiBxGH7gDV7SbGb//qUD7vm247b7nFGjLJPsW0UPtAQxLY3Z7ffkV/+x8cAK0V0mR5Xf2iJTsWCoYSZxniPko4z5SBY5NEmYeD41T6f+zRyu1jVqYjUpcnYDWofpDDLXbf243gNdXYkkvaksgb2zoOf8jmPQZsyj8TTzduRs+x5CZcftptXLlB7nXFlhD9PgNZpRw0XIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RMhOxoqJtOaDIu18C0ThPBs4GrJeVPxabKxy7It78g=;
 b=Mee3t5ndapHxvOJwSL9PbjSu48ydgHsRqsDLttGmIC+5tFEuHVQjHaqAl+SzSbrzQzD0VcexiPo/yWybM2/+jILdg0Dw9UWd3QMUFjQddhi9KdzS+zsir1WB4Wf8Vt5rOg66FlKOKfbCjA4kNdNE+X6xyd3w0PePDzgbXWPfmXqOpWAgSXkzxYAjuNIV14tumA5SAs2QlJF1MFMe/sbm1tjbshNVN3ecIOrF8R6g9qMwEffleFJN72pq3NO8hfX7f1X3ctoaEtOtgwqRWiGrr0HeGfFfCUD9oMH5X+HSvcrziVoGLdVQoXWxBAywb5QLPnRvPwZPHE1b5vZPDj8hoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 00:07:39 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 00:07:39 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] make: accelerate tagging process
Date: Mon, 14 Sep 2026 20:07:33 -0400
Message-ID: <20260915000735.1146790-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0804.namprd03.prod.outlook.com
 (2603:10b6:408:13f::29) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: e51fd5d2-ee26-4db6-9377-08df12bd5aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	1Xpe8sI7QVv6yI/2aDlNgAIQUFwYZmrWEXohduex69ESj9WgqkYTYZSY0qoiG+a/1u/ajHXrXjl6lG1thMUZRaG6nYHQLflRvTlINcDe9ETCuadG4FQeh44mvABMQt3uL6fhWE4PrWg/Yr7FKvncmmznyjK7Rrh+RGgEXaD9YnorEpPyb7HhR3Pz6/Cx3hpll6CgWkyfmvvy6Lj6nCsb7f1JJtIuNLWdnOB+bGTe0m/nFquSUuZMeKz5iAmN+imsA51gB4HTht/3NfbnIm7bjTJrjaK3KM+j1f3TisC7YMgwllDYkbfQgAo3dsnbPvEpKMT6VYewgMOXZCFIG5ZCT27XjJOYolsw1kvt4nPyIwV+xhLuGpGTTh2D98GvhEHdDO4UvG9CopEVxTKkCtPQ0chowslkGl4wvechX8IapSegy1tIPnNiu6WRuKojwmL1G2rTj/YkTcD2tw7e6LilPn6uCMS3geRGetg2v91igVKmUVQk0ei/Yq6JB74Kr9Yr+0NRrVE8v3Ix2CjdITejWbc6z7OfDcpF+3ysBKzhk50+ijds3zB7Z0ibexgZWWSTNcWRuZ5BFILqQUQF3m+s2b1+/r6FHV6gExcSRe1WTZlb9hqssk3+oMPolLhg5ZL6Q3NaVratGub7zI95rIM8L+fQG13aV1rJj11Wx2hPmkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwlaF8QFov9PalGKPZV1wiOg7GUY4KTpcCaEdX6y9BR4Jmi/XHFskLk+eGpT?=
 =?us-ascii?Q?jOIv77K0eD9W/Atmd2yH/SI4dR0r1sqb37nuclarl0hp+EJ3JscEnUAWz31U?=
 =?us-ascii?Q?1kz/qiRQa91D4wcc2BhTTxWxtI3UapyE67e9C55X2Z1CYvvImPJECmTDw4/S?=
 =?us-ascii?Q?cIgcDAVxhfAiVmkmiysc0Bp3urMH27FGDsX1AfiaQmNtw9Vu7yu60/c8fJNf?=
 =?us-ascii?Q?80HJr5RtHpDAUyc5WLMJhipfHuefrj18H8lrZJ+PUTYPL5zqNwue8Iy9HnJ6?=
 =?us-ascii?Q?wzZvZgURd2U5zgElzeH7v3urd29qvWvjOt17yGGi7XsSgmSbW6vWHA6ccf6P?=
 =?us-ascii?Q?ZhmhHInnQ31HYUY4z/NsdxahQO3M+xqiUzo6kl/e2jp56/MFRz6fod7YVvzZ?=
 =?us-ascii?Q?W2XQw7LFv1fLKTG8phdQh54jaqOnEmMIT1t9ggf0CP+0uL1VbxaE0xZo+hkX?=
 =?us-ascii?Q?eUpJb1XefaRdgIdzvXrZRjRcldkoLcmzzb9/sPm7QN1+e5oCOSMYSzUQkoaJ?=
 =?us-ascii?Q?yOw022f8iIoCGA83iTivlcgrkhnGWIrbc16GYcHzSNoQofEBL7h7cmitNmVe?=
 =?us-ascii?Q?GIEhcLlYJcH9qtfMpP7lDsfOB54RY9QbbtKb3LVSa4sqd0Va+4ROKDlfYV9B?=
 =?us-ascii?Q?xmtInxzZsST2vj6YdLG/frjbiuVG/i+2JHwq1sz8vZ6hn1Lg9C+0mG3VnqfA?=
 =?us-ascii?Q?A791UGiACf/JlD4BrnykOYXUFm8C5Qt6ipw6hc+JX+dTU2Gh0UByplehv5c9?=
 =?us-ascii?Q?Dq4YDByEtH5QtciTrPDDu2Wft23XDSkp4RTR8Lr+jS7Px4LKr9+ZnnwkwMrS?=
 =?us-ascii?Q?XJhNtcFjrFjlqOgHaYa5/HIOThS+d/ECE5aLa8JtvQFJilp7GhCCCivOqwPv?=
 =?us-ascii?Q?Grgu6KRNTl+5yyTGwg/DYCT12KvmHYuOuHgKF0TySsko7b0r60tiLS6wj4a8?=
 =?us-ascii?Q?NEPmb5FWl17JE5RogEB2a95vIqKV/wK93VXxOS0NmOJIgxmOzjin4nlUs3DE?=
 =?us-ascii?Q?4DnIbLhN6ddXhsTytezclEYdqtpu3QVfrct0gn+YuPUDCoDvTSfPG0ZkqV3C?=
 =?us-ascii?Q?P/KYtQiIm3HWjbgiXqafXKmnZyR9Y01YoLiEqrng3DECF4U/E2YaUngVsob+?=
 =?us-ascii?Q?EHQqbrYRJA5kejG+JQfV6RX/Sm2+7l47dsk49Ua0mKbJD84eu/2OsJdVrP2i?=
 =?us-ascii?Q?vVTscvjIK2sM3m6G1iKDr6O9ohDO8NAsWP8sQzy+xRwHd11oRkRFJf2NSbQe?=
 =?us-ascii?Q?phasug9HHvdcZ+yetBNgvHotEqjJIlA6+1fmr7CntFK0/GDH7RSK/8QBmBA8?=
 =?us-ascii?Q?HfZUql+5dxfTbpC7suelvPcKluYu5syfG8XWqsiUwZ91E+tteOd/CA5fdq3H?=
 =?us-ascii?Q?2e4bhjZe1o7IlqfPZmDs2DRu0fEMJSbcS45DvyosRBK3GFjc3nsKMRUfA4ks?=
 =?us-ascii?Q?IHJbNrN2yGMOw8tIr4mnvtu8UKlV9VMyJ9UM+W1ns5g/rPhAoDjym8kVlOcD?=
 =?us-ascii?Q?Pi45XKSgKAXP/hxtXq2VI2zf51jh85agelpaiJeNqm+aUo8A9zVPx1bNRvkp?=
 =?us-ascii?Q?NdCwPtUXE+aJOE7J0SlEB5xU5EGnF3sDR5ndLVFJOKdFuB22SWNWtCD9wwbB?=
 =?us-ascii?Q?HG3UoJuePshW8eNO4/AtqLeu1j/GFxckY+hiKDI0ohLWvPyKrxreB+NRxvmj?=
 =?us-ascii?Q?T2Wg0Yxd2P9ue//CR0k2w7+jY8I7VyR5PkhFTnpFwo5bn4ThCfV642xfSlX1?=
 =?us-ascii?Q?QwX8MS4XQQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51fd5d2-ee26-4db6-9377-08df12bd5aec
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:07:39.4640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFFt/Wfw/eSdwm4Sz3Jtt675+r9NVqRuJ2CMr5ySfzqmHQG9lwGoaLI28PxnfRUv6FOqA6i5H80tteeYp8XXvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

The tags generation takes about 5 minutes on my working station, which
is comparable to building the whole localyesconfig.

This series adds support for parallel execution of ctags, and caching of
the intermediate tags. With that, the tagging performance numbers with

		time  make -j8 ALLSOURCE_ARCHS=all tags

look like:

                          real          user         sys
Clean tags build before   4m40.797s     4m14.229s     0m39.341s
Clean tags build after    1m39.203s     9m1.450s      2m7.552s
Single file update        0m7.738s      0m7.042s      0m4.031s
Unchanged sources         0m0.722s      0m0.482s      0m0.304s

The cache is compressed and takes less than 10% of the tags file.
The caching doesn't measurably affect clean tags build performance.

Yury Norov (2):
  make: parallelize tags generation
  make: cache per-directory tags

 .gitignore                      |   1 +
 Documentation/kbuild/kbuild.rst |  48 ++++++
 Makefile                        |   6 +-
 scripts/Makefile.tags           |  15 ++
 scripts/tags.sh                 | 266 ++++++++++++++++++++++++++++++--
 5 files changed, 323 insertions(+), 13 deletions(-)
 create mode 100644 scripts/Makefile.tags

-- 
2.53.0

