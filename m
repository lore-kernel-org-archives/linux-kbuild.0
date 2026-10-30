Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394074;
	b=Kmyw/NglYIReePfcP5rQyRNm7UCFbh7yf6cMHzXtYZL8ZMlp0nspq/SyB5D11Hs+YSG2
	 dRwGZsFWonUCOeWBy82ibzcTgh+DV26d0A+aI6ucnOcu8+eHUPTQwr0hvM8l9K6P4FoU0
	 kVVHGJEWBrpVnieTLzsMAhXZUxb6zywVuDAfUsfmlJbpDlx2rzpTu23R6l7ngrV5WTFgh
	 UqU6lSCEuMqDoMhPPdQmYJpD62yOQnDYMoVVb5vj6U1FuyFvvurCMMsxNdmyEW9lmlGj8
	 VF3+nyY0v4mGnI+R/6I9GCIG9Plk0/IBhNcRJ0vtZpNqcWgQEDDIXaVB0ENFstA1kTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:CC:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jokmvT97cdT91HDgt/UEHeaPTdXRagGP5/JD5X3QTQg=;
	b=YcFZlCPIXdQRlMkxj9y3R8401CjguMDa6paDr5yF0oVwI0RU38KXiD6S4NMgTmLOix9n
	 DXE4E0uwzp5A+loS+uFa6k36yRtYw/Ix8Kjz8b/cpxONicEmOc5sDtqJKFnIdVd6lGnf9
	 FLFFYVFS8evxCKbGBW780mVqduEH+UlaVGuxniBpFann5Clbe8qHpkyRY97SQZipfEX2u
	 JrslPBiGl54zJILYsVg5hyAL3rEAiecpP+8IfRYW4lfLUZ1GUeHabPIaaBs+Xp121l1jC
	 3n+Cd6gETkSklPMixEwlY+DzxJ3ZWAiIyG7qwh5o04AjGPPl761RvBs6R/bN5UjIIvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oufDnUJL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE7606A323;
	Fri, 30 Oct 2026 21:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBE7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oufDnUJL
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJ21YN923821;
	Fri, 30 Oct 2026 21:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=jo
	kmvT97cdT91HDgt/UEHeaPTdXRagGP5/JD5X3QTQg=; b=oufDnUJL9Aua9/7skT
	9uFbS+WNxU8rbHD56Z4zoK0Z0LgfCTj30OUbsJCUWrsDl3uDeT+lRrLVlpsFqr2Q
	L309kq8SLCsUHB6lS+TjI18+tmx6b7KQUbjFolx+vtDTLUaqMq7awZDXb+O1Pziw
	2xNqEWMDVeUAkapkN4e5fvb6nkf8DJJRZKfk+cEexElY/VES/Wbpv8ZkZs5kxtTC
	+4WETTOpcsywcE1eqQIIDHMGWfpYVgUExM37aXTeOUC5TPPPoaQvVJkBH11BwSPI
	wevlmI5lCJyiazOBepY4asnJyj/XBVWBu3+bou63hO9pWifB4RspEa8GgZ/vRpuY
	gRVg==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmvmy4xv0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:44 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 891B2D2F8;
	Fri, 30 Oct 2026 21:00:44 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:44 -1200
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:43 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:43 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt9/Wqs+oCZBkv80zOHDSPav9UZZWOJV1T0FSbTzvoofY+183JhXw3el3pxkpNaXs2nZESWOdu+ejCTkXUDkz+3VCt55Dp38lXhiPiGBwrWdgdACbI5+29YD61JoM80HZd6GHPMz+2yXyp2MVuM0W0G9jLoupAaktMX9/uyAOccRnzY+LP3/cqDJe8CrAGfEJCow49eMaMLw6QNpAdVz5vaBROTJUfwcMKikicd+qOH16A4Ru4xK8kiNcRUwoBLKp+340QjnMMSFJ1Wf3mFny/A2+fMmFIpWMdKQv5FSrrmV9U8jkj9lnBL7ECTZzXTW4kGfbo+giD2lyv/8RUXZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jokmvT97cdT91HDgt/UEHeaPTdXRagGP5/JD5X3QTQg=;
 b=jzCAqTsveh3GhOoZSqfJE9Xd4ux+fkoGP+LOLNGw7rtuOpFPE/soAtVLDSkvThhpzgMOO7ssyJGvNN/FuWn9IVXfVvDIkcuNKjZZkmTybgfdMPYKaxXIPu6PllilJTEA8sFuk/AVgnqj1wn+N6CRYLlbucAxwu61zbI+ryjaNtXbI2UF78s2Itd0mMU/sUIHDSJHvsBQA3dr/KMhSJfjI7HONq3lbqjEOyNqbme07MeO5Yj/VFMBJcZqzsft2+yEZZrFTgvA/wb8BFwB5QQxJGiMTbi0DRaTYseGGPo6BqiXeV4a74HeEByLs3DyXLrq/r/B3VGhNuZXC7glQyG+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:38 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:38 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:08 -0700
Subject: [PATCH 12/23] net: hpe: sl: add the control layer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-12-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
To: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>, Doug Ledford <doug.ledford@hpe.com>,
        "Sandeep
 Bhoot" <sandeep.bhoot@hpe.com>,
        Mamila Santosh
	<santosh-kumar.mamila@hpe.com>,
        Iraimani P <iraimani.pavadai@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: CH0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:610:b0::22) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 (2603:10b6:8:225::20)
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|IA4PR84MB951192:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a4694c-6338-4dd5-2052-08df36c8d905
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|921020|56012099006|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022115727099003|261022075727099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 4GQLdtK7bylrm+YC1t6s+Ro7P+LVrCRrI0mb1hjshhgP4TLcwEfd9VbMu2CP8QQnQyZSpaQC2PTttFiPh1P17YoXC3O0ZE+SQ9aWBAo/rst5+nMNx9DeJTK1RHTvabxUKLL+Rb6DKwGw9TKBGgoNGMZjvDSNIpzA+ocLbR02s53+t6WAVA1xDuhW8805Osh2qlOKzaEOlvnPpm0IogIqc9OlXwinzmrb0/7TXJaHOY6mvU5ZrVtAKrLq6uARPM7mRu5Xr+omJHRRKWKBaDubQ9AWe3DqYFilpgUY4tmwOIP5PyABGodA9XkCD84ETXsp3YRP/MQXron8SPQbg/6vKhQnFjUAz99TB5fUYUDj4NetHbN//RiSiH+YcSG2So8AfrDGfHvFYTh1T6p1TLL62OXBViiYyAcr8IzO1fm0juxWePKzCmL213p64uCSHzlR9CutKrHykuTH0RZnue7qaA+z4zdRI/8o3PB+gqINLEKlRhOa0MURQ+u/25x3rpG9OHzocl0PxJycCN6evS8dLvQRzAdXpiOIfTZnr6sVGtRTKUVGIRuf71OQe2x9CTfA9dhgarbdvbRn+tg8ZfygNL3IO78jXb6GQlFkC1ssb6B1eiwKD6Y5uiWIzq5nIoA+e+/JJkxHDD9SYGhgONINsNXyubIf5TJKKR4Fr39oq+tfzGkapzOgy7wYwQ5Mu2HAAvkvuUXEtrILmhpyw53DNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHR0WkVRQSs3VDE4eEZFSXdGcTBFTnJnbE4yWHA2d0ljQzI0NmJTMWp0NXdJ?=
 =?utf-8?B?OXA4Wis1NDVOSnk1UWdibFBySng5cHdWWFhHYkpZcGJMaE1ES2pZS3hQRjJ0?=
 =?utf-8?B?bkpSUEdFbFcxTmNIK0dId0tXT2xLeXcwdXdMT2xSUlVqWWk4NjlZbjhEMnVL?=
 =?utf-8?B?VkNjR0FETnh4NmVXMExWeWNDMFd6U0J4STlhNCtuOThvdmwxS1lTK1JpdFJj?=
 =?utf-8?B?bzcwWFdLRGkzTE16RFhGSzJMQWIyeWM5eWFaWTBydThJbHcwcUhmRXBLMm90?=
 =?utf-8?B?OVBMa2crZEZrOXBqakpVRUtYYTREWUp3alRRaDd5eTFSZ0IrcWVpS0g5am84?=
 =?utf-8?B?WDh2SDRWdmYvZm9NU3VwQjBGSGxOSlBvYU04OUR0dlpOSXMyaEIwalVYR096?=
 =?utf-8?B?ejhhRURlR1ZGRkJZTkFYbmJuQkI3KzdpcGIxdjRxVDBhWG1HNktpTWdvNW0x?=
 =?utf-8?B?UWViZXN4MlpBbjVTclI1bXR3UktPWTgvNkJKWm85Zk9NN1QveTlMT05scGhL?=
 =?utf-8?B?VjRtaHV5NHZ6RzJ2ckhBK24vWUdPdkN4eFJYSCttSDU4cU9ld1p5RlRmYUV6?=
 =?utf-8?B?VUJTd3p4djFZajZHbi84ZUlEMU8vaWZuNkRnT0ZpenJ3Q3o5OGkwKzlrVUNS?=
 =?utf-8?B?cEdHc2JiMnh1Q3ZPTEV0ZjdxUm5KZmh6cGJYa2lpY21WQ0RBZ0ZvaTdKVHBS?=
 =?utf-8?B?SlRIclU5VVZ1WTREKzdGS09DVVlnUEt1ZnBTNTViTkZhVDZNamVldXV4WHpm?=
 =?utf-8?B?ZG5yaGF0SkhKdUJhM0d5b2c5WXN3aC9wU0ZrVW0vbkVJdE4xZ0JtTEtOWjR1?=
 =?utf-8?B?ZldFZzBhUnlGZTZhdmpXZHFqd1Rick91cUsrTG1yTjV5WTUzMzBGN3h5Zk8x?=
 =?utf-8?B?d2dpMU1QZWxNRnBMTFF4Z3RkbjZTbEZIb1duZFB0TWM2Uk9CcUo0MDcwMTVx?=
 =?utf-8?B?dmVhQkFUeFc5eWJPYU5qR1hDcWUvWWtPTWNaUmpnOG1LU003STB1SytWNEJu?=
 =?utf-8?B?ZW5HcXFkYjdhbWE2aWJQbExrMXJFTnZOSGRudERTcy82dHcveXc0Mk55bkNC?=
 =?utf-8?B?NUJkWGNIcXNLcGtqZnZBbXBaRUNLaGNMc2JOUVZIRTEwbEo1UWR6R1Zvenho?=
 =?utf-8?B?Z045ZFpoS096SmZRblJ2UFRZVW44MVpjTy9aZHZOM2JFVW9qVVhHQ0ZWc0V5?=
 =?utf-8?B?a0xzYXVncmpvK0dKRS9UY2VRK1FYNStqTkU2dGZsVHVQSFBiNm92Y1A4NXFR?=
 =?utf-8?B?YndySktKT2NzRUk5bGIxTU9NTGJWYUppK1VZeXF2bFpkczQrKzEwUVRjaEM5?=
 =?utf-8?B?LzAvUHlwNldiNFJ3WWsrWjB3UlNtTFNpKys4OVl3dm0zOElZa3VQT2ZjVVpD?=
 =?utf-8?B?SmRJRG04dmNUTkc5SVhWRkgrbWdNWXpXNFAwS3RoNkxhQ2ducm92eU51L3VK?=
 =?utf-8?B?V3QvTVRRdkxWRmRtRW5kNVR4NzBzaEtyeHVkME9UeU1GVWlyZDBGdXJmNE1Q?=
 =?utf-8?B?TW81cG42amZjNjUwN1JXaEMwL3hHVjgzSHZNREhSZG1SMXRiVzlKSG1SSzlh?=
 =?utf-8?B?RjI5Y0xGcW9tV2F6T05seC9xWVpUYXFoOStBVjNOa0hoVzgvQi9MUjh4Qjhh?=
 =?utf-8?B?Zjh3UlRCSnlwRzU3QmFSWkRCZVA2eVJmd01FOWZWWGVkTXlhSjJqdDlmK1Yz?=
 =?utf-8?B?TytHbUFEM0dQNkt6eldJaGlLRHhhbGJLUDY5dlc0dGVSaGZCYmVMdjJUNHRa?=
 =?utf-8?B?Y1NBRjUxODZoN2V4K1ZPOE5IOWg1T0l5NHNIc2ZpY2JQMXhkTXBpYTcrSnRK?=
 =?utf-8?B?LzlwcTlFVkc5Qk80akpKdnVLQzFSNndoZVVvc0R4OWZ6RXZPZkNRUEE0c3pQ?=
 =?utf-8?B?ZzcyOUlQVHJiczN1QTgyVFlCZmpWemxkczQ0MmRzb0svYnQ5eGYxRktDN0tz?=
 =?utf-8?B?R3pVeVNob0lIMVJ5cmZMUjdJZGNqUHprcERVNGgrMjVyNXdBMCs2ZEw1Y1Fi?=
 =?utf-8?B?RUZ0bFc0ZmhSclFtVDUrWFNsUFNrNWg2cVJLYTdDUnozYWdNTmdGMkNndjl1?=
 =?utf-8?B?SDdPQ082bXI3WXBiUkMxcXhHZ0FGdVN6R2RkOGdjNVhha2xRak5yTFFPSHZW?=
 =?utf-8?B?aHRmZm1STXBhNWFVWVlMWWZ0RTJmZVoxNDRlOHNQNmtjTE9hSDhuL1NjV0NB?=
 =?utf-8?B?MU92ZCs1bnZiK1BmK0M5QzFGWVdwa2owSytyY1VvZHIrd0NSdDVydHMwMFA0?=
 =?utf-8?B?czI0WDU1dVZOZG4wc1A0OHFwSjRnTGxQeUszTk5jNldsclRJeUo2N0dBM0hz?=
 =?utf-8?B?TlBTTS9FcWk1V2NWemRPa3NvYXUzcFBKZHp1Q3M0YTcwVzlpajc5dz09?=
X-Exchange-RoutingPolicyChecked: y4nJ4ylvZw1Hgvnd7xjSuv7vvciZUp7lDWtpNBPk+F7YA00FPXBD58OMFcXPJsA7YqY1en4UwbCVzU2if1h2tLqHT+D6TztUaxIHhPsk8xd6fARjJSwQxRCjIOvHGYNHaudBM2z1cN9YRW/oSL9832d/q7H8gnLY160sVMqoVfjG2GJ3w6C5zFnMLIG8VzGpb9lcz8+jB68px+g1SRZ7h3hxTl8qHOVCB6VnAhK7sdu/HHtKaPh3yoDnR+Cdz7eWj3pvZ7tHbVvXjjwV8HLesTE3JLS568tmeSYHQSLpePecYg1SroH85H0VipUssZ44efj1wCwoSIl4bnavMYbIDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a4694c-6338-4dd5-2052-08df36c8d905
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:38.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCrLy1pF7eOegkc/FY7L4ihw7FrG+rv8NpzV/2wQnbicndYle/8o+E4JOMEqPO9gAMQpbpIqFQbwnvY6phElyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: 1IadV2qlMA46P35Cw3RT641kmqENWLVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX2eY66psVO8R/
 ioi0SmD/j9quOdT1DJlCqR+4ebtRa2K3kesRCNvlAvKYMOTjDQiV8MAJyAPsWQpkfuh2lLy7V2g
 MiOtNBpmrEQzrGckrJZGAn79RafnB7wRaeZrM7W6MccGG6FTTdgesezkKYQe+WHyfowvIzqcMZl
 tZjO3kb3M5IeoTzeu52d14a1bvFgHtbdIwok8k1KFnymXLOnIqT9lTZ7RNvxtDPGUGUtdZMHau6
 WtxHKDUXZcS01CSoZuAnRwRi+3oDpLRayVeStDGwY6yPHeULLOu3raalDMtMnpUJ2DocSHOS5A2
 V5pqJ8XSfxg/+vDrGgk/QS/zERVGhPJbON8DMoz1olGaCrq0nsT8skXmmSq4ZCiVjpu2MltafIv
 memwqNni4ZAPvz5V9eZKCnjoyzYaFXqJ8fxhvbtlk+ji5yavHsLv/+SMSCH5F+os2NNZ/PmZ3OT
 skQSQNz7dDV5/7cYQkg==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6ae5057d cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ModqzXLkJJ0tFyq98apW:22 a=MvuuwTCpAAAA:8 a=LheknTmOAAAA:8 a=L5Av9709AAAA:8
 a=2BiQyANNfSttp-q31nQA:9 a=PIuFQOwuOW9NwPU1:21 a=QEXdDO2ut3YA:10
 a=CJm8_YjmqYhBDa0z6R8t:22 a=Jwhx0Ts52bvbemp9dy6E:22
X-Proofpoint-GUID: 1IadV2qlMA46P35Cw3RT641kmqENWLVA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX/ZX+o7RbXo4V
 Ixu38zYx3WNJx7FWbE+QOpv9hQeSD+mhWXOo1q5xE3sMrYX1sIxtsxjsmPGwJW/BiV1DcJ6k8Ou
 eHEwGKAkB9fITvU3N80Vu6lmanfC7u4=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the SL control layer, which validates and serialises requests from
the NIC driver and sysfs onto the core state machines, and delivers
link group notifications back.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (239), LONG_LINE_STRING (18), LONG_LINE_COMMENT (2)
- CHECK: UNNECESSARY_PARENTHESES (21), ALLOC_SIZEOF_STRUCT (4)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Co-developed-by: Iraimani P <iraimani.pavadai@hpe.com>
Signed-off-by: Iraimani P <iraimani.pavadai@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c  |  164 +++
 .../hpe/sl/ctrl/data/sl_ctrl_data_lgrp_trace.c     |   50 +
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c  |  424 +++++++
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_llr.c   |   64 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c    |  290 +++++
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c    |  351 ++++++
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c  |  258 ++++
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.c    | 1230 ++++++++++++++++++++
 .../ethernet/hpe/sl/ctrl/sl_ctrl_link_counters.c   |  388 ++++++
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c    |  202 ++++
 .../ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c   |  539 +++++++++
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c   |  865 ++++++++++++++
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c     |  630 ++++++++++
 .../ethernet/hpe/sl/ctrl/sl_ctrl_llr_counters.c    |  136 +++
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c     |  536 +++++++++
 .../ethernet/hpe/sl/ctrl/sl_ctrl_mac_counters.c    |   56 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_media_counters.c  |  157 +++
 17 files changed, 6340 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c
new file mode 100644
index 000000000000..279e41770f48
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_media_lgrp.h"
+#include "sl_core_lgrp.h"
+
+#include "data/sl_core_data_lgrp.h"
+#include "data/sl_media_data_lgrp.h"
+
+#include "sl_ctrl_data_lgrp.h"
+
+#define LOG_NAME SL_CTRL_LGRP_LOG_NAME
+
+int sl_ctrl_data_lgrp_err_trace_enable_set(struct sl_ctrl_lgrp *ctrl_lgrp, bool err_trace_enable)
+{
+	struct sl_core_lgrp *held_lgrp_1 __free(sl_core_lgrp_put) = NULL;
+	int rtn;
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "set (err_trace_enable = %s)", err_trace_enable ? "true" : "false");
+
+	held_lgrp_1 = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!held_lgrp_1)
+		return -ENODEV;
+	spin_lock(&ctrl_lgrp->config_lock);
+	rtn = sl_core_data_lgrp_err_trace_enable_set(held_lgrp_1,
+						     err_trace_enable);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "core trace enable set failed [%d]", rtn);
+		spin_unlock(&ctrl_lgrp->config_lock);
+		return rtn;
+	}
+
+	rtn = sl_media_data_lgrp_err_trace_enable_set(sl_media_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num),
+						      err_trace_enable);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "media trace enable set failed [%d]", rtn);
+		spin_unlock(&ctrl_lgrp->config_lock);
+		return rtn;
+	}
+
+	ctrl_lgrp->err_trace_enable = err_trace_enable;
+
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_warn_trace_set(struct sl_ctrl_lgrp *ctrl_lgrp, bool err_trace_enable)
+{
+	struct sl_core_lgrp *held_lgrp_1 __free(sl_core_lgrp_put) = NULL;
+	int rtn;
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "set (warn_trace_enable = %s)", err_trace_enable ? "true" : "false");
+
+	held_lgrp_1 = sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num);
+	if (!held_lgrp_1)
+		return -ENODEV;
+	spin_lock(&ctrl_lgrp->config_lock);
+	rtn = sl_core_data_lgrp_warn_trace_enable_set(held_lgrp_1,
+						      err_trace_enable);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "core trace enable set failed [%d]", rtn);
+		spin_unlock(&ctrl_lgrp->config_lock);
+		return rtn;
+	}
+
+	rtn = sl_media_data_lgrp_warn_trace_enable_set(sl_media_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num),
+						       err_trace_enable);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "media trace enable set failed [%d]", rtn);
+		spin_unlock(&ctrl_lgrp->config_lock);
+		return rtn;
+	}
+
+	ctrl_lgrp->warn_trace_enable = err_trace_enable;
+
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_serdes_lane_io_trace_set(struct sl_ctrl_lgrp *ctrl_lgrp, bool serdes_lane_io_trace)
+{
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME,
+			"set (serdes_lane_io_trace = %s)", serdes_lane_io_trace ? "enable" : "disable");
+
+	spin_lock(&ctrl_lgrp->config_lock);
+	ctrl_lgrp->serdes_lane_io_trace_enable = serdes_lane_io_trace;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_mfs_get(struct sl_ctrl_lgrp *ctrl_lgrp, u32 *mfs)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*mfs = ctrl_lgrp->config.mfs;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "get (mfs = %u)", *mfs);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_furcation_get(struct sl_ctrl_lgrp *ctrl_lgrp, u32 *furcation)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*furcation = ctrl_lgrp->config.furcation;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "get (furcation = %u)", *furcation);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_fec_mode_get(struct sl_ctrl_lgrp *ctrl_lgrp, u32 *fec_mode)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*fec_mode = ctrl_lgrp->config.fec_mode;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "get (fec_mode = %u)", *fec_mode);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_tech_map_get(struct sl_ctrl_lgrp *ctrl_lgrp, u32 *tech_map)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*tech_map = ctrl_lgrp->config.tech_map;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "get (tech_map = 0x%X)", *tech_map);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_fec_map_get(struct sl_ctrl_lgrp *ctrl_lgrp, u32 *fec_map)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*fec_map = ctrl_lgrp->config.fec_map;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "get (fec_map = 0x%X)", *fec_map);
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_options_get(struct sl_ctrl_lgrp *ctrl_lgrp, u32 *options)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*options = ctrl_lgrp->config.options;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "get (options = 0x%X)", *options);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp_trace.c b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp_trace.c
new file mode 100644
index 000000000000..5b6dfe73495e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp_trace.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+
+#include "data/sl_ctrl_data_lgrp_trace.h"
+
+#define LOG_NAME SL_CTRL_LGRP_LOG_NAME
+
+int sl_ctrl_data_lgrp_is_err_trace_enabled(struct sl_ctrl_lgrp *ctrl_lgrp, bool *err_trace_enable)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*err_trace_enable = ctrl_lgrp->err_trace_enable;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME,
+			"is err trace enabled (err_trace_enable = %s)",
+			*err_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+int sl_ctrl_data_lgrp_is_warn_trace_enabled(struct sl_ctrl_lgrp *ctrl_lgrp, bool *warn_trace_enable)
+{
+	spin_lock(&ctrl_lgrp->config_lock);
+	*warn_trace_enable = ctrl_lgrp->warn_trace_enable;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME,
+			"is warn trace enabled (warn_trace_enable = %s)",
+			*warn_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+bool sl_ctrl_data_lgrp_is_serdes_lane_io_trace_enabled(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+	bool serdes_lane_io_trace;
+
+	spin_lock(&ctrl_lgrp->config_lock);
+	serdes_lane_io_trace = ctrl_lgrp->serdes_lane_io_trace_enable;
+	spin_unlock(&ctrl_lgrp->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME,
+			"is serdes lane io trace enabled (serdes_lane_io_trace = %s)",
+			serdes_lane_io_trace ? "enabled" : "disabled");
+
+	return serdes_lane_io_trace;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c
new file mode 100644
index 000000000000..dfb1b820d5ef
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_link.h"
+#include "data/sl_core_data_link.h"
+
+#include "data/sl_ctrl_data_link.h"
+
+#define LOG_NAME SL_CTRL_LINK_LOG_NAME
+
+int sl_ctrl_data_link_state_get(struct sl_ctrl_link *ctrl_link, u32 *link_state)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	int rtn;
+	u32 core_link_state;
+	u32 ctrl_link_state;
+
+	held_link_1 = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				       ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!held_link_1)
+		return -ENODEV;
+	spin_lock(&ctrl_link->data_lock);
+	rtn = sl_core_data_link_state_get(held_link_1, &core_link_state);
+	ctrl_link_state = ctrl_link->state;
+	spin_unlock(&ctrl_link->data_lock);
+
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+				      "sl_core_data_link_state_get failed (rtn = %d)", rtn);
+		return rtn;
+	}
+
+	*link_state = (core_link_state == SL_CORE_LINK_STATE_AN) ? SL_LINK_STATE_AN : ctrl_link_state;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (link_state = %u %s)",
+			*link_state,
+			sl_link_state_str(*link_state));
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_settle_wait_ms_get(struct sl_ctrl_link *ctrl_link, u32 *fec_up_settle_wait_ms)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*fec_up_settle_wait_ms = ctrl_link->config.fec_up_settle_wait_ms;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (fec_up_settle_wait_ms = %d)", *fec_up_settle_wait_ms);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_check_wait_ms_get(struct sl_ctrl_link *ctrl_link, s32 *fec_up_check_wait_ms)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*fec_up_check_wait_ms = ctrl_link->config.fec_up_check_wait_ms;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (fec_up_check_wait_ms = %d)", *fec_up_check_wait_ms);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_ucw_limit_get(struct sl_ctrl_link *ctrl_link, s32 *fec_up_ucw_limit)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*fec_up_ucw_limit = ctrl_link->config.fec_up_ucw_limit;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (fec_up_ucw_limit = %d)", *fec_up_ucw_limit);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_ccw_limit_get(struct sl_ctrl_link *ctrl_link, s32 *fec_up_ccw_limit)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*fec_up_ccw_limit = ctrl_link->config.fec_up_ccw_limit;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (fec_up_ccw_limit = %d)", *fec_up_ccw_limit);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_policy_fec_mon_period_ms_get(struct sl_ctrl_link *ctrl_link, s32 *mon_period_ms)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*mon_period_ms = ctrl_link->policy.fec_mon_period_ms;
+	spin_unlock(&ctrl_link->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (mon_period_ms = %d)", *mon_period_ms);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_policy_fec_mon_ucw_down_limit_get(struct sl_ctrl_link *ctrl_link, s32 *mon_ucw_down_limit)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*mon_ucw_down_limit = ctrl_link->policy.fec_mon_ucw_down_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (mon_ucw_down_limit = %d)", *mon_ucw_down_limit);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_policy_fec_mon_ucw_warn_limit_get(struct sl_ctrl_link *ctrl_link, s32 *mon_ucw_warn_limit)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*mon_ucw_warn_limit = ctrl_link->policy.fec_mon_ucw_warn_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (mon_ucw_warn_limit = %d)", *mon_ucw_warn_limit);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_policy_fec_mon_ccw_down_limit_get(struct sl_ctrl_link *ctrl_link, s32 *mon_ccw_down_limit)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*mon_ccw_down_limit = ctrl_link->policy.fec_mon_ccw_down_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (mon_ccw_down_limit = %d)", *mon_ccw_down_limit);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_policy_fec_mon_ccw_warn_limit_get(struct sl_ctrl_link *ctrl_link, s32 *mon_ccw_warn_limit)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*mon_ccw_warn_limit = ctrl_link->policy.fec_mon_ccw_warn_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (mon_ccw_warn_limit = %d)", *mon_ccw_warn_limit);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_down_cache_ucw_cntr_get(struct sl_ctrl_link *ctrl_link, u64 *ucw)
+{
+	spin_lock(&ctrl_link->fec_down_cache.lock);
+	*ucw = ctrl_link->fec_down_cache.cw_cntrs.ucw;
+	spin_unlock(&ctrl_link->fec_down_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (ucw = %llu)", *ucw);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_down_cache_ccw_cntr_get(struct sl_ctrl_link *ctrl_link, u64 *ccw)
+{
+	spin_lock(&ctrl_link->fec_down_cache.lock);
+	*ccw = ctrl_link->fec_down_cache.cw_cntrs.ccw;
+	spin_unlock(&ctrl_link->fec_down_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (ccw = %llu)", *ccw);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_down_cache_gcw_cntr_get(struct sl_ctrl_link *ctrl_link, u64 *gcw)
+{
+	spin_lock(&ctrl_link->fec_down_cache.lock);
+	*gcw = ctrl_link->fec_down_cache.cw_cntrs.gcw;
+	spin_unlock(&ctrl_link->fec_down_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (gcw = %llu)", *gcw);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_down_cache_lane_cntr_get(struct sl_ctrl_link *ctrl_link, u8 lane_num, u64 *lane_cntr)
+{
+	spin_lock(&ctrl_link->fec_down_cache.lock);
+	*lane_cntr = ctrl_link->fec_down_cache.lane_cntrs.lanes[lane_num];
+	spin_unlock(&ctrl_link->fec_down_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (lane_num = %d, lane_cntr = %llu)", lane_num, *lane_cntr);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_down_cache_tail_cntr_get(struct sl_ctrl_link *ctrl_link, u8 bin_num, u64 *tail_cntr)
+{
+	spin_lock(&ctrl_link->fec_down_cache.lock);
+	*tail_cntr = ctrl_link->fec_down_cache.tail_cntrs.ccw_bins[bin_num];
+	spin_unlock(&ctrl_link->fec_down_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (bin_num = %d, tail_cntr = %llu)", bin_num, *tail_cntr);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_mon_period_ms_get(struct sl_ctrl_link *ctrl_link, u32 *mon_period_get)
+
+{
+	spin_lock(&ctrl_link->fec_data.lock);
+	*mon_period_get = ctrl_link->fec_data.info.monitor.period_ms;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (mon_period_get = %u)", *mon_period_get);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_mon_ucw_down_limit_get(struct sl_ctrl_link *ctrl_link, s32 *ucw_down_limit)
+{
+	u32 period_ms;
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	period_ms = ctrl_link->fec_data.info.monitor.period_ms;
+	*ucw_down_limit = ctrl_link->fec_data.info.monitor.ucw_down_limit;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	if (!period_ms) {
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+				       "fec_mon_ucw_down_limit_get failed (monitoring disabled)");
+		return -EBADRQC;
+	}
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_mon_ccw_down_limit_get(struct sl_ctrl_link *ctrl_link, s32 *ccw_down_limit)
+{
+	u32 period_ms;
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	period_ms = ctrl_link->fec_data.info.monitor.period_ms;
+	*ccw_down_limit = ctrl_link->fec_data.info.monitor.ccw_down_limit;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	if (!period_ms) {
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+				       "fec_mon_ccw_down_limit_get failed (monitoring disabled)");
+		return -EBADRQC;
+	}
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_mon_ccw_warn_limit_get(struct sl_ctrl_link *ctrl_link, s32 *ccw_warn_limit)
+{
+	u32 period_ms;
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	period_ms = ctrl_link->fec_data.info.monitor.period_ms;
+	*ccw_warn_limit = ctrl_link->fec_data.info.monitor.ccw_warn_limit;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	if (!period_ms) {
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+				       "fec_mon_ccw_warn_limit_get failed (monitoring disabled)");
+		return -EBADRQC;
+	}
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_mon_ucw_warn_limit_get(struct sl_ctrl_link *ctrl_link, s32 *ucw_warn_limit)
+{
+	u32 period_ms;
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	period_ms = ctrl_link->fec_data.info.monitor.period_ms;
+	*ucw_warn_limit = ctrl_link->fec_data.info.monitor.ucw_warn_limit;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	if (!period_ms) {
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+				       "fec_mon_ucw_warn_limit_get failed (monitoring disabled)");
+		return -EBADRQC;
+	}
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_cache_ucw_cntr_get(struct sl_ctrl_link *ctrl_link, u64 *ucw)
+{
+	spin_lock(&ctrl_link->fec_up_cache.lock);
+	*ucw = ctrl_link->fec_up_cache.cw_cntrs.ucw;
+	spin_unlock(&ctrl_link->fec_up_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (ucw = %llu)", *ucw);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_cache_ccw_cntr_get(struct sl_ctrl_link *ctrl_link, u64 *ccw)
+{
+	spin_lock(&ctrl_link->fec_up_cache.lock);
+	*ccw = ctrl_link->fec_up_cache.cw_cntrs.ccw;
+	spin_unlock(&ctrl_link->fec_up_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (ccw = %llu)", *ccw);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_cache_gcw_cntr_get(struct sl_ctrl_link *ctrl_link, u64 *gcw)
+{
+	spin_lock(&ctrl_link->fec_up_cache.lock);
+	*gcw = ctrl_link->fec_up_cache.cw_cntrs.gcw;
+	spin_unlock(&ctrl_link->fec_up_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (gcw = %llu)", *gcw);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_cache_lane_cntr_get(struct sl_ctrl_link *ctrl_link, u8 lane_num, u64 *lane_cntr)
+{
+	spin_lock(&ctrl_link->fec_up_cache.lock);
+	*lane_cntr = ctrl_link->fec_up_cache.lane_cntrs.lanes[lane_num];
+	spin_unlock(&ctrl_link->fec_up_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (lane_num = %d, lane_cntr = %llu)", lane_num, *lane_cntr);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_fec_up_cache_tail_cntr_get(struct sl_ctrl_link *ctrl_link, u8 bin_num, u64 *tail_cntr)
+{
+	spin_lock(&ctrl_link->fec_up_cache.lock);
+	*tail_cntr = ctrl_link->fec_up_cache.tail_cntrs.ccw_bins[bin_num];
+	spin_unlock(&ctrl_link->fec_up_cache.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (bin_num = %d, tail_cntr = %llu)", bin_num, *tail_cntr);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_policy_options_get(struct sl_ctrl_link *ctrl_link, u32 *options)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*options = ctrl_link->policy.options;
+	spin_unlock(&ctrl_link->config_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (options = 0x%08x)", *options);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_up_timeout_ms_get(struct sl_ctrl_link *ctrl_link, u32 *link_up_timeout_ms)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*link_up_timeout_ms = ctrl_link->config.link_up_timeout_ms;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (link_up_timeout_ms = %d)", *link_up_timeout_ms);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_up_tries_max_get(struct sl_ctrl_link *ctrl_link, u32 *link_up_tries_max)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*link_up_tries_max = ctrl_link->config.link_up_tries_max;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (link_up_tries_max = %d)", *link_up_tries_max);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_config_options_get(struct sl_ctrl_link *ctrl_link, u32 *options)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*options = ctrl_link->config.options;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (options = 0x%08x)", *options);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_pause_map_get(struct sl_ctrl_link *ctrl_link, u32 *pause_map)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*pause_map = ctrl_link->config.pause_map;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (pause_map = 0x%x)", *pause_map);
+
+	return 0;
+}
+
+int sl_ctrl_data_link_hpe_map_get(struct sl_ctrl_link *ctrl_link, u32 *hpe_map)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*hpe_map = ctrl_link->config.hpe_map;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"get (hpe_map = 0x%x)", *hpe_map);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_llr.c b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_llr.c
new file mode 100644
index 000000000000..be742b146a0a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_llr.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_data_llr.h"
+
+#define LOG_NAME SL_CTRL_LLR_LOG_NAME
+
+int sl_ctrl_data_llr_config_mode_get(struct sl_ctrl_llr *ctrl_llr, u32 *mode)
+{
+	spin_lock(&ctrl_llr->data_lock);
+	*mode = ctrl_llr->config.mode;
+	spin_unlock(&ctrl_llr->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "get (mode = %u)\n", *mode);
+
+	return 0;
+}
+
+int sl_ctrl_data_llr_config_setup_timeout_ms_get(struct sl_ctrl_llr *ctrl_llr, u32 *setup_timeout_ms)
+{
+	spin_lock(&ctrl_llr->data_lock);
+	*setup_timeout_ms = ctrl_llr->config.setup_timeout_ms;
+	spin_unlock(&ctrl_llr->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "get (setup_timeout_ms = %u)\n", *setup_timeout_ms);
+
+	return 0;
+}
+
+int sl_ctrl_data_llr_config_start_timeout_ms_get(struct sl_ctrl_llr *ctrl_llr, u32 *start_timeout_ms)
+{
+	spin_lock(&ctrl_llr->data_lock);
+	*start_timeout_ms = ctrl_llr->config.start_timeout_ms;
+	spin_unlock(&ctrl_llr->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "get (start_timeout_ms = %u)\n", *start_timeout_ms);
+
+	return 0;
+}
+
+int sl_ctrl_data_llr_config_link_dn_behavior_get(struct sl_ctrl_llr *ctrl_llr, u32 *link_dn_behavior)
+{
+	spin_lock(&ctrl_llr->data_lock);
+	*link_dn_behavior = ctrl_llr->config.link_dn_behavior;
+	spin_unlock(&ctrl_llr->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "get (link_dn_behavior = %u)\n", *link_dn_behavior);
+
+	return 0;
+}
+
+int sl_ctrl_data_llr_config_options_get(struct sl_ctrl_llr *ctrl_llr, u32 *options)
+{
+	spin_lock(&ctrl_llr->data_lock);
+	*options = ctrl_llr->config.options;
+	spin_unlock(&ctrl_llr->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "get (options = 0x%08x)\n", *options);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c
new file mode 100644
index 000000000000..0295dd902d6d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021-2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+
+#include "sl_asic.h"
+#include "sl_sysfs.h"
+#include "base/sl_ctrl_log.h"
+#include "sl_core_ldev.h"
+#include "sl_media_ldev.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+
+#define LOG_NAME SL_CTRL_LDEV_LOG_NAME
+
+#define SL_CTRL_LDEV_DEL_TIMEOUT_MS 2000
+
+static struct sl_ctrl_ldev *ctrl_ldevs[SL_ASIC_MAX_LDEVS];
+static DEFINE_SPINLOCK(ctrl_ldevs_lock);
+
+#define CONFIG_SL_DEFAULT_WQ_MAX_ACTIVE  0 /* 0 is default (256 work items in queue). */
+int sl_ctrl_ldev_new(u8 ldev_num, struct workqueue_struct *workq,
+		     struct sl_ldev_attr *ldev_attr)
+{
+	int                   rtn;
+	struct sl_ctrl_ldev   *ctrl_ldev;
+
+	ctrl_ldev = sl_ctrl_ldev_get(ldev_num);
+	if (ctrl_ldev) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "exists (ldev = 0x%p)", ctrl_ldev);
+		return -EBADRQC;
+	}
+
+	ctrl_ldev = kzalloc(sizeof(struct sl_ctrl_ldev), GFP_KERNEL);
+	if (!ctrl_ldev)
+		return -ENOMEM;
+
+	ctrl_ldev->magic = SL_CTRL_LDEV_MAGIC;
+	ctrl_ldev->ver   = SL_CTRL_LDEV_VER;
+	ctrl_ldev->num   = ldev_num;
+	ctrl_ldev->attr  = *ldev_attr;
+
+	kref_init(&ctrl_ldev->ref_cnt);
+	init_completion(&ctrl_ldev->del_complete);
+
+	spin_lock_init(&ctrl_ldev->data_lock);
+
+	if (IS_ERR_OR_NULL(workq)) {
+		ctrl_ldev->workq = alloc_workqueue("%s%u",
+						   WQ_MEM_RECLAIM | WQ_PERCPU,
+						   CONFIG_SL_DEFAULT_WQ_MAX_ACTIVE, "sl-ldev", ldev_num);
+		if (!ctrl_ldev->workq) {
+			rtn = -ENOMEM;
+			sl_ctrl_log_err(ctrl_ldev, LOG_NAME, "alloc_workqueue failed [%d]", rtn);
+			goto out;
+		}
+
+		sl_ctrl_log_dbg(ctrl_ldev, LOG_NAME, "created workqueue (workq = 0x%p)", ctrl_ldev->workq);
+		ctrl_ldev->create_workq = true;
+	} else {
+		ctrl_ldev->workq = workq;
+		sl_ctrl_log_dbg(ctrl_ldev, LOG_NAME, "client workqueue (workq = 0x%p)", ctrl_ldev->workq);
+	}
+
+	ctrl_ldev->notif_workq = alloc_workqueue("%s%u-notif",
+						 WQ_MEM_RECLAIM | WQ_PERCPU,
+						 CONFIG_SL_DEFAULT_WQ_MAX_ACTIVE, "sl-ldev", ldev_num);
+	if (!ctrl_ldev->notif_workq) {
+		rtn = -ENOMEM;
+		sl_ctrl_log_err(ctrl_ldev, LOG_NAME, "alloc_workqueue notif failed [%d]", rtn);
+		goto out_del_wq;
+	}
+
+	rtn = sl_core_ldev_new(ldev_num, ctrl_ldev->attr.accessors,
+			       ctrl_ldev->attr.ops, ctrl_ldev->workq);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_ldev, LOG_NAME, "core_ldev_new failed [%d]", rtn);
+		goto out_del_notif_wq;
+	}
+
+	rtn = sl_media_ldev_new(ldev_num, ctrl_ldev->workq);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_ldev, LOG_NAME, "media_ldev_new failed [%d]", rtn);
+		goto out_del_core;
+	}
+
+	sl_ctrl_log_dbg(ctrl_ldev, LOG_NAME, "new (ldev = 0x%p)", ctrl_ldev);
+
+	spin_lock(&ctrl_ldevs_lock);
+	ctrl_ldevs[ldev_num] = ctrl_ldev;
+	spin_unlock(&ctrl_ldevs_lock);
+
+	return 0;
+
+out_del_core:
+	sl_core_ldev_del(ldev_num);
+out_del_notif_wq:
+	destroy_workqueue(ctrl_ldev->notif_workq);
+
+out_del_wq:
+	if (ctrl_ldev->create_workq)
+		destroy_workqueue(ctrl_ldev->workq);
+out:
+	kfree(ctrl_ldev);
+
+	return rtn;
+}
+
+#define SERDES_INIT_MAX_TRIES 3
+#define SERDES_INIT_DELAY_MS  1000
+int sl_ctrl_ldev_serdes_init(u8 ldev_num)
+{
+	int rtn;
+	int tries;
+	struct sl_ctrl_ldev *ctrl_ldev;
+
+	ctrl_ldev = sl_ctrl_ldev_get(ldev_num);
+	if (!ctrl_ldev) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "ldev not found (ldev_num = %u)", ldev_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_ldev_kref_get_unless_zero(ctrl_ldev)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"kref_get_unless_zero failed (ldev = 0x%p)", ctrl_ldev);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_ldev, LOG_NAME, "serdes init (ldev = 0x%p)", ctrl_ldev);
+
+	tries = SERDES_INIT_MAX_TRIES;
+	do {
+		rtn = sl_core_ldev_serdes_init(ldev_num);
+		if (rtn == 0)
+			goto out;
+		tries--;
+		if (tries)
+			msleep(SERDES_INIT_DELAY_MS);
+	} while (tries);
+
+out:
+	if (sl_ctrl_ldev_put(ctrl_ldev))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"serdes init - ldev removed (ldev = 0x%p)", ctrl_ldev);
+
+	return rtn;
+}
+
+static void sl_ctrl_ldev_release(struct kref *ref)
+{
+	struct sl_ctrl_ldev *ctrl_ldev;
+	u8                  ldev_num;
+	u8                  lgrp_num;
+	int                 rtn;
+
+	ctrl_ldev = container_of(ref, struct sl_ctrl_ldev, ref_cnt);
+	ldev_num = ctrl_ldev->num;
+
+	sl_ctrl_log_dbg(ctrl_ldev, LOG_NAME, "release (ldev = 0x%p)", ctrl_ldev);
+
+	/* Not repeated on a retry: the sysfs delete drops kobject references. */
+	if (!ctrl_ldev->children_deleted) {
+		for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num) {
+			rtn = sl_ctrl_lgrp_del(ldev_num, lgrp_num);
+			if (rtn && rtn != -EBADRQC)
+				goto retry;
+		}
+		ctrl_ldev->children_deleted = true;
+	}
+
+	if (!ctrl_ldev->sysfs_deleted) {
+		/* Must delete sysfs first to guarantee nobody is reading */
+		sl_sysfs_ldev_delete(ctrl_ldev);
+		ctrl_ldev->sysfs_deleted = true;
+	}
+
+	rtn = sl_core_ldev_del(ldev_num);
+	if (rtn) {
+		/*
+		 * A core lgrp or link refused deletion, so the core ldev is
+		 * still published and uses the workqueue and ldev state.
+		 * Nobody holds a reference any more, so re-arm one for the
+		 * next sl_ctrl_ldev_del() to retry, and wake the waiter so it
+		 * can report the failure.
+		 */
+		sl_ctrl_log_err_trace(ctrl_ldev, LOG_NAME,
+				      "release - core_ldev_del failed, ldev kept [%d]", rtn);
+		goto retry;
+	}
+	sl_media_ldev_del(ldev_num);
+
+	destroy_workqueue(ctrl_ldev->notif_workq);
+
+	if (ctrl_ldev->create_workq)
+		destroy_workqueue(ctrl_ldev->workq);
+
+	spin_lock(&ctrl_ldevs_lock);
+	ctrl_ldevs[ldev_num] = NULL;
+	spin_unlock(&ctrl_ldevs_lock);
+
+	complete_all(&ctrl_ldev->del_complete);
+
+	kfree(ctrl_ldev);
+	return;
+
+retry:
+	kref_init(&ctrl_ldev->ref_cnt);
+	complete_all(&ctrl_ldev->del_complete);
+}
+
+int sl_ctrl_ldev_put(struct sl_ctrl_ldev *ctrl_ldev)
+{
+	return kref_put(&ctrl_ldev->ref_cnt, sl_ctrl_ldev_release);
+}
+
+int sl_ctrl_ldev_del(u8 ldev_num)
+{
+	struct sl_ctrl_ldev *ctrl_ldev;
+	unsigned long       timeleft;
+
+	ctrl_ldev = sl_ctrl_ldev_get(ldev_num);
+	if (!ctrl_ldev) {
+		sl_ctrl_log_err_trace(NULL, LOG_NAME,
+				      "del not found (ldev_num = %u)", ldev_num);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_ldev, LOG_NAME, "del (ldev = 0x%p)", ctrl_ldev);
+
+	/*
+	 * Release cannot run before the put below, so rearming a completion
+	 * left over from an earlier failed del is safe.
+	 */
+	reinit_completion(&ctrl_ldev->del_complete);
+
+	if (!sl_ctrl_ldev_put(ctrl_ldev)) {
+		timeleft = wait_for_completion_timeout(&ctrl_ldev->del_complete,
+						       msecs_to_jiffies(SL_CTRL_LDEV_DEL_TIMEOUT_MS));
+
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"del completion_timeout (timeleft = %lums)", timeleft);
+
+		if (timeleft == 0) {
+			sl_ctrl_log_err(NULL, LOG_NAME,
+					"del timed out (ctrl_ldev = 0x%p)", ctrl_ldev);
+			return -ETIMEDOUT;
+		}
+	}
+
+	/*
+	 * A successful release unpublishes and frees the ldev. If it is still
+	 * published, the core ldev refused deletion and was kept for a retry.
+	 * Only the pointer value is compared, the ldev is not dereferenced.
+	 */
+	if (sl_ctrl_ldev_get(ldev_num) == ctrl_ldev)
+		return -EBUSY;
+
+	return 0;
+}
+
+bool sl_ctrl_ldev_kref_get_unless_zero(struct sl_ctrl_ldev *ctrl_ldev)
+{
+	return (kref_get_unless_zero(&ctrl_ldev->ref_cnt) != 0);
+}
+
+struct sl_ctrl_ldev *sl_ctrl_ldev_get(u8 ldev_num)
+{
+	struct sl_ctrl_ldev *ctrl_ldev;
+
+	spin_lock(&ctrl_ldevs_lock);
+	ctrl_ldev = ctrl_ldevs[ldev_num];
+	spin_unlock(&ctrl_ldevs_lock);
+
+	sl_ctrl_log_dbg(NULL, LOG_NAME, "get (ldev_num = %u, ldev = 0x%p)",
+			ldev_num, ctrl_ldev);
+
+	return ctrl_ldev;
+}
+
+void sl_ctrl_ldev_exit(void)
+{
+	u8 ldev_num;
+
+	for (ldev_num = 0; ldev_num < SL_ASIC_MAX_LDEVS; ++ldev_num)
+		sl_ctrl_ldev_del(ldev_num);
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c
new file mode 100644
index 000000000000..1e7240325fcc
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021-2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+#include "sl_asic.h"
+#include "sl_sysfs.h"
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_lgrp_notif.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_llr.h"
+#include "sl_ctrl_mac.h"
+#include "sl_media_lgrp.h"
+#include "sl_core_lgrp.h"
+
+#define LOG_NAME SL_CTRL_LGRP_LOG_NAME
+
+#define SL_CTRL_LGRP_DEL_TIMEOUT_MS 2000
+
+static struct sl_ctrl_lgrp *ctrl_lgrps[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS];
+static DEFINE_SPINLOCK(ctrl_lgrps_lock);
+
+int sl_ctrl_lgrp_new(u8 ldev_num, u8 lgrp_num, struct kobject *sysfs_parent)
+{
+	int                  rtn;
+	struct sl_ctrl_ldev *ctrl_ldev;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+
+	ctrl_ldev = sl_ctrl_ldev_get(ldev_num);
+	if (!ctrl_ldev) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "missing ldev (ldev_num = %u)", ldev_num);
+		return -EBADRQC;
+	}
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "exists (lgrp = 0x%p)", ctrl_lgrp);
+		return -EBADRQC;
+	}
+
+	ctrl_lgrp = kzalloc(sizeof(struct sl_ctrl_lgrp), GFP_KERNEL);
+	if (!ctrl_lgrp)
+		return -ENOMEM;
+
+	snprintf(ctrl_lgrp->log_connect_id,
+		 sizeof(ctrl_lgrp->log_connect_id), "ctrl-lgrp%02u", lgrp_num);
+
+	ctrl_lgrp->magic     = SL_CTRL_LGRP_MAGIC;
+	ctrl_lgrp->ver       = SL_CTRL_LGRP_VER;
+	ctrl_lgrp->num       = lgrp_num;
+	ctrl_lgrp->ctrl_ldev = sl_ctrl_ldev_get(ldev_num);
+
+	kref_init(&ctrl_lgrp->ref_cnt);
+	init_completion(&ctrl_lgrp->del_complete);
+
+	spin_lock_init(&ctrl_lgrp->data_lock);
+	spin_lock_init(&ctrl_lgrp->config_lock);
+	spin_lock_init(&ctrl_lgrp->log_lock);
+
+	spin_lock_init(&(ctrl_lgrp->ctrl_notif.lock));
+
+	rtn = kfifo_alloc(&ctrl_lgrp->ctrl_notif.fifo,
+			  SL_CTRL_LGRP_NOTIF_MSG_COUNT * sizeof(struct sl_lgrp_notif_msg),
+			  GFP_KERNEL);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "create notif fifo failed");
+		rtn = -ENOMEM;
+		goto out_free;
+	}
+	INIT_WORK(&ctrl_lgrp->notif_work, sl_ctrl_lgrp_notif_work);
+
+	rtn = sl_core_lgrp_new(ldev_num, lgrp_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME, "core_lgrp_new failed [%d]", rtn);
+		goto out_kfifo_free;
+	}
+
+	rtn = sl_media_lgrp_new(ldev_num, lgrp_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME, "media_lgrp_new failed [%d]", rtn);
+		goto out_core_lgrp;
+	}
+
+	if (sysfs_parent) {
+		ctrl_lgrp->parent_kobj = sysfs_parent;
+
+		rtn = sl_sysfs_lgrp_create(ctrl_lgrp);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
+					      "sysfs_lgrp_create failed");
+			goto out_media_lgrp;
+		}
+	}
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "new (lgrp = 0x%p)", ctrl_lgrp);
+
+	spin_lock(&ctrl_lgrps_lock);
+	ctrl_lgrps[ldev_num][lgrp_num] = ctrl_lgrp;
+	spin_unlock(&ctrl_lgrps_lock);
+
+	return 0;
+
+out_media_lgrp:
+	sl_media_lgrp_del(ldev_num, lgrp_num);
+out_core_lgrp:
+	sl_core_lgrp_del(ldev_num, lgrp_num);
+out_kfifo_free:
+	kfifo_free(&ctrl_lgrp->ctrl_notif.fifo);
+out_free:
+	kfree(ctrl_lgrp);
+
+	return rtn;
+}
+
+static void sl_ctrl_lgrp_release(struct kref *ref)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	u8                   ldev_num;
+	u8                   lgrp_num;
+	u8                   link_num;
+	int                  rtn;
+
+	ctrl_lgrp = container_of(ref, struct sl_ctrl_lgrp, ref_cnt);
+	ldev_num = ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = ctrl_lgrp->num;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err_trace(NULL, LOG_NAME,
+				      "release lgrp not found (lgrp_num = %u)", lgrp_num);
+		return;
+	}
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "del (lgrp = 0x%p)", ctrl_lgrp);
+
+	if (!ctrl_lgrp->children_deleted) {
+		for (link_num = 0; link_num < SL_ASIC_MAX_LINKS; ++link_num) {
+			rtn = sl_ctrl_link_del(ldev_num, lgrp_num, link_num);
+			if (rtn && rtn != -EBADRQC)
+				goto retry;
+
+			rtn = sl_ctrl_llr_del(ldev_num, lgrp_num, link_num);
+			if (rtn && rtn != -EBADRQC)
+				goto retry;
+
+			rtn = sl_ctrl_mac_del(ldev_num, lgrp_num, link_num);
+			if (rtn && rtn != -EBADRQC)
+				goto retry;
+		}
+		ctrl_lgrp->children_deleted = true;
+	}
+
+	if (!ctrl_lgrp->sysfs_deleted) {
+		/* Must delete sysfs first to guarantee nobody is reading */
+		sl_sysfs_lgrp_delete(ctrl_lgrp);
+		ctrl_lgrp->sysfs_deleted = true;
+	}
+
+	rtn = sl_core_lgrp_del(ldev_num, lgrp_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
+				      "release - core_lgrp_del failed [%d]", rtn);
+		goto retry;
+	}
+
+	sl_media_lgrp_del(ldev_num, lgrp_num);
+
+	cancel_work_sync(&ctrl_lgrp->notif_work);
+	kfifo_free(&ctrl_lgrp->ctrl_notif.fifo);
+
+	spin_lock(&ctrl_lgrps_lock);
+	ctrl_lgrps[ldev_num][lgrp_num] = NULL;
+	spin_unlock(&ctrl_lgrps_lock);
+
+	complete_all(&ctrl_lgrp->del_complete);
+
+	kfree(ctrl_lgrp);
+	return;
+
+retry:
+	sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
+			      "release - child/core deletion failed [%d]", rtn);
+	kref_init(&ctrl_lgrp->ref_cnt);
+	complete_all(&ctrl_lgrp->del_complete);
+}
+
+int sl_ctrl_lgrp_put(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+	return kref_put(&ctrl_lgrp->ref_cnt, sl_ctrl_lgrp_release);
+}
+
+int sl_ctrl_lgrp_del(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	unsigned long        timeleft;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err_trace(NULL, LOG_NAME,
+				      "del not found (ldev_num = %u, lgrp_num = %u)", ldev_num, lgrp_num);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "del (lgrp = 0x%p)", ctrl_lgrp);
+	reinit_completion(&ctrl_lgrp->del_complete);
+
+	if (!sl_ctrl_lgrp_put(ctrl_lgrp)) {
+		timeleft = wait_for_completion_timeout(&ctrl_lgrp->del_complete,
+						       msecs_to_jiffies(SL_CTRL_LGRP_DEL_TIMEOUT_MS));
+
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"del completion_timeout (timeleft = %lums)", timeleft);
+
+		if (timeleft == 0) {
+			sl_ctrl_log_err(NULL, LOG_NAME,
+					"del timed out (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+			return -ETIMEDOUT;
+		}
+	}
+	if (sl_ctrl_lgrp_get(ldev_num, lgrp_num) == ctrl_lgrp)
+		return -EBUSY;
+
+	return 0;
+}
+
+bool sl_ctrl_lgrp_kref_get_unless_zero(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+	return (kref_get_unless_zero(&ctrl_lgrp->ref_cnt) != 0);
+}
+
+struct sl_ctrl_lgrp *sl_ctrl_lgrp_get(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+
+	spin_lock(&ctrl_lgrps_lock);
+	ctrl_lgrp = ctrl_lgrps[ldev_num][lgrp_num];
+	spin_unlock(&ctrl_lgrps_lock);
+
+	return ctrl_lgrp;
+}
+
+int sl_ctrl_lgrp_connect_id_set(u8 ldev_num, u8 lgrp_num, const char *connect_id)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+	unsigned long       irq_flags;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "NULL lgrp");
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_lgrp_kref_get_unless_zero(ctrl_lgrp)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"kref_get_unless_zero failed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+		return -EBADRQC;
+	}
+
+	spin_lock_irqsave(&ctrl_lgrp->log_lock, irq_flags);
+	strscpy_pad(ctrl_lgrp->log_connect_id, connect_id,
+		    sizeof(ctrl_lgrp->log_connect_id));
+	spin_unlock_irqrestore(&ctrl_lgrp->log_lock, irq_flags);
+
+	sl_media_lgrp_connect_id_set(ldev_num, lgrp_num, connect_id);
+
+	sl_core_lgrp_connect_id_set(ldev_num, lgrp_num, connect_id);
+
+	if (sl_ctrl_lgrp_put(ctrl_lgrp))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"connect_id set - lgrp removed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+
+	return 0;
+}
+
+int sl_ctrl_lgrp_config_set(u8 ldev_num, u8 lgrp_num, struct sl_lgrp_config *lgrp_config)
+{
+	int                 rtn;
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "NULL lgrp");
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_lgrp_kref_get_unless_zero(ctrl_lgrp)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"kref_get_unless_zero failed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "config set:");
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "  mfs       = %d",   lgrp_config->mfs);
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "  furcation = 0x%X", lgrp_config->furcation);
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "  fec_mode  = 0x%X", lgrp_config->fec_mode);
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "  tech_map  = 0x%X", lgrp_config->tech_map);
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "  fec_map   = 0x%X", lgrp_config->fec_map);
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "  options   = 0x%X", lgrp_config->options);
+
+	rtn = sl_core_lgrp_config_set(ldev_num, lgrp_num, lgrp_config);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME, "core_lgrp_config_set failed [%d]", rtn);
+		goto out;
+	}
+
+	spin_lock(&(ctrl_lgrp->config_lock));
+	ctrl_lgrp->config = *lgrp_config;
+	spin_unlock(&(ctrl_lgrp->config_lock));
+
+	rtn = 0;
+
+out:
+	if (sl_ctrl_lgrp_put(ctrl_lgrp))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"config set - lgrp removed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+
+	return rtn;
+}
+
+int sl_ctrl_lgrp_policy_set(u8 ldev_num, u8 lgrp_num, struct sl_lgrp_policy *lgrp_policy)
+{
+	struct sl_ctrl_lgrp *ctrl_lgrp;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "NULL lgrp");
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_lgrp_kref_get_unless_zero(ctrl_lgrp)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"kref_get_unless_zero failed (lgrp = 0x%p)", ctrl_lgrp);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "policy set");
+
+	spin_lock(&(ctrl_lgrp->config_lock));
+	ctrl_lgrp->policy = *lgrp_policy;
+	spin_unlock(&(ctrl_lgrp->config_lock));
+
+	if (sl_ctrl_lgrp_put(ctrl_lgrp))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"policy set - lgrp removed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c
new file mode 100644
index 000000000000..298b8ab0306c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_lgrp_notif.h"
+#include "sl_media_lgrp.h"
+
+#define LOG_NAME SL_CTRL_LGRP_NOTIF_LOG_NAME
+
+#define SL_CTRL_LGRP_NOTIF_LIST_STATE_IDLE    0
+#define SL_CTRL_LGRP_NOTIF_LIST_STATE_SENDING 1
+
+static int sl_ctrl_lgrp_notif_list_state_get(struct sl_ctrl_lgrp *ctrl_lgrp)
+{
+	int notif_list_state;
+
+	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
+	notif_list_state = ctrl_lgrp->ctrl_notif.list_state;
+	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+
+	return notif_list_state;
+}
+
+int sl_ctrl_lgrp_notif_callback_reg(u8 ldev_num, u8 lgrp_num, sl_lgrp_notif_t callback,
+				    u32 types, void *tag)
+{
+	int                   rtn;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    reg_idx;
+	u8                    counter;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "NULL ctrl_lgrp");
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_lgrp_kref_get_unless_zero(ctrl_lgrp)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"kref_get_unless_zero failed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME,
+			"notif callback reg (types = 0x%X, tag = 0x%p)",
+			types, tag);
+
+	counter = 0;
+	while (sl_ctrl_lgrp_notif_list_state_get(ctrl_lgrp) == SL_CTRL_LGRP_NOTIF_LIST_STATE_SENDING) {
+		msleep(20);
+		counter++;
+		if (counter >= 10) {
+			sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "registration timed out");
+			rtn = -ETIMEDOUT;
+			goto out;
+		}
+	}
+
+	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
+	if (ctrl_lgrp->ctrl_notif.list_state == SL_CTRL_LGRP_NOTIF_LIST_STATE_SENDING) {
+		spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "notif list is currently being used");
+		rtn = -EBUSY;
+		goto out;
+	}
+	for (reg_idx = 0; reg_idx < ARRAY_SIZE(ctrl_lgrp->ctrl_notif.reg_entry); ++reg_idx) {
+		if (ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].types == 0) {
+			ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].callback = callback;
+			ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].tag = tag;
+			ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].types = types;
+			break;
+		}
+	}
+	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+
+	if (reg_idx >= ARRAY_SIZE(ctrl_lgrp->ctrl_notif.reg_entry)) {
+		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "registration list is full");
+		rtn = -ENOSPC;
+		goto out;
+	}
+
+	if (types & SL_LGRP_NOTIF_MEDIA_PRESENT)
+		sl_media_lgrp_real_cable_if_present_send(ldev_num, lgrp_num);
+
+	if (types & SL_LGRP_NOTIF_MEDIA_NOT_PRESENT)
+		sl_media_lgrp_real_cable_if_not_present_send(ldev_num, lgrp_num);
+
+	if (types & SL_LGRP_NOTIF_MEDIA_HOT)
+		sl_media_lgrp_cable_hot_send(ldev_num, lgrp_num);
+
+	if (types & SL_LGRP_NOTIF_MEDIA_WARM)
+		sl_media_lgrp_cable_warm_send(ldev_num, lgrp_num);
+
+	if (types & SL_LGRP_NOTIF_MEDIA_COLD)
+		sl_media_lgrp_cable_cold_send(ldev_num, lgrp_num);
+
+	rtn = 0;
+out:
+	if (sl_ctrl_lgrp_put(ctrl_lgrp))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"notif callback reg - lgrp removed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+
+	return rtn;
+}
+
+int sl_ctrl_lgrp_notif_callback_unreg(u8 ldev_num, u8 lgrp_num, sl_lgrp_notif_t callback,
+				      u32 types)
+{
+	int                   rtn;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	u8                    reg_idx;
+	u8                    counter;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "NULL ctrl_lgrp");
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_lgrp_kref_get_unless_zero(ctrl_lgrp)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"kref_get_unless_zero failed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+		return -EBADRQC;
+	}
+
+	sl_media_lgrp_cable_temp_flags_clr(ldev_num, lgrp_num);
+
+	counter = 0;
+	while (sl_ctrl_lgrp_notif_list_state_get(ctrl_lgrp) == SL_CTRL_LGRP_NOTIF_LIST_STATE_SENDING) {
+		msleep(20);
+		counter++;
+		if (counter >= 10) {
+			sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "unregistration timed out");
+			rtn = -ETIMEDOUT;
+			goto out;
+		}
+	}
+
+	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
+	if (ctrl_lgrp->ctrl_notif.list_state == SL_CTRL_LGRP_NOTIF_LIST_STATE_SENDING) {
+		spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "notif list is currently being used");
+		rtn = -EBUSY;
+		goto out;
+	}
+	for (reg_idx = 0; reg_idx < ARRAY_SIZE(ctrl_lgrp->ctrl_notif.reg_entry); ++reg_idx) {
+		if ((ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].types == types) &&
+		    (ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].callback == callback)) {
+			ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].callback = NULL;
+			ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].tag = NULL;
+			ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].types = 0;
+			break;
+		}
+	}
+	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "notif callback unreg (types = 0x%X)", types);
+
+	rtn = 0;
+
+out:
+	if (sl_ctrl_lgrp_put(ctrl_lgrp))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"notif callback unreg - lgrp removed (ctrl_lgrp = 0x%p)", ctrl_lgrp);
+
+	return rtn;
+}
+
+int sl_ctrl_lgrp_notif_enqueue(struct sl_ctrl_lgrp *ctrl_lgrp, u8 link_num,
+			       u32 type, union sl_lgrp_notif_info *info, u64 info_map)
+{
+	struct sl_lgrp_notif_msg notif_msg;
+	int                      rtn;
+
+	if (!ctrl_lgrp)
+		return 0;
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME,
+			"notif enqueue (link_num = %d, type = 0x%X)", link_num, type);
+
+	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
+	if (kfifo_is_full(&ctrl_lgrp->ctrl_notif.fifo)) {
+		spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "notification fifo is full");
+		return -ENOSPC;
+	}
+	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+
+	if (info)
+		notif_msg.info = *info;
+	else
+		memset(&notif_msg.info, 0, sizeof(notif_msg.info));
+
+	notif_msg.ldev_num = ctrl_lgrp->ctrl_ldev->num;
+	notif_msg.lgrp_num = ctrl_lgrp->num;
+	notif_msg.link_num = link_num;
+	notif_msg.type     = type;
+	notif_msg.info_map = info_map;
+
+	rtn = kfifo_in_spinlocked(&ctrl_lgrp->ctrl_notif.fifo, &notif_msg, sizeof(notif_msg),
+				  &ctrl_lgrp->ctrl_notif.lock);
+	if (rtn != sizeof(notif_msg)) {
+		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "write to kfifo failed");
+		return -EFAULT;
+	}
+
+	/* Don't catch the return as it might already be running.  This is ok */
+	queue_work(ctrl_lgrp->ctrl_ldev->notif_workq, &ctrl_lgrp->notif_work);
+
+	return 0;
+}
+
+void sl_ctrl_lgrp_notif_work(struct work_struct *notif_work)
+{
+	struct sl_ctrl_lgrp      *ctrl_lgrp;
+	struct sl_lgrp_notif_msg  notif_msg;
+	u8                        reg_idx;
+	int                       rtn;
+	bool                      is_empty;
+
+	ctrl_lgrp = container_of(notif_work, struct sl_ctrl_lgrp, notif_work);
+
+	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "notif work");
+
+	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
+	ctrl_lgrp->ctrl_notif.list_state = SL_CTRL_LGRP_NOTIF_LIST_STATE_SENDING;
+	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+
+	do {
+		rtn = kfifo_out_spinlocked(&ctrl_lgrp->ctrl_notif.fifo,
+					   &notif_msg, sizeof(notif_msg),
+					   &ctrl_lgrp->ctrl_notif.lock);
+		if (rtn != sizeof(notif_msg)) {
+			sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "read from kfifo failed");
+			goto out;
+		}
+		for (reg_idx = 0; reg_idx < SL_CTRL_LGRP_NOTIF_REG_COUNT; ++reg_idx) {
+			if (notif_msg.type & ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].types)
+				(ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].callback)
+				(ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].tag, &notif_msg);
+		}
+		spin_lock(&ctrl_lgrp->ctrl_notif.lock);
+		is_empty = kfifo_is_empty(&ctrl_lgrp->ctrl_notif.fifo);
+		spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+	} while (!is_empty);
+
+out:
+	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
+	ctrl_lgrp->ctrl_notif.list_state = SL_CTRL_LGRP_NOTIF_LIST_STATE_IDLE;
+	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.c
new file mode 100644
index 000000000000..f3a8246fcb67
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.c
@@ -0,0 +1,1230 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/completion.h>
+
+#include "sl_asic.h"
+#include "sl_sysfs.h"
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_link.h"
+#include "data/sl_ctrl_data_link.h"
+#include "sl_ctrl_link_priv.h"
+#include "sl_ctrl_link_counters.h"
+#include "sl_core_str.h"
+#include "sl_core_link.h"
+#include "sl_core_link_an.h"
+#include "sl_core_mac.h"
+#include "sl_core_llr.h"
+#include "sl_core_link_an.h"
+#include "sl_test_common.h"
+
+#define LOG_NAME SL_CTRL_LINK_LOG_NAME
+
+#define SL_CTRL_LINK_DOWN_WAIT_TIMEOUT_MS 2000
+#define SL_CTRL_LINK_DEL_WAIT_TIMEOUT_MS  2000
+
+static struct sl_ctrl_link *ctrl_links[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+static DEFINE_SPINLOCK(ctrl_links_lock);
+
+static void sl_ctrl_link_release_work(struct work_struct *work);
+
+int sl_ctrl_link_new(u8 ldev_num, u8 lgrp_num, u8 link_num, struct kobject *sysfs_parent)
+{
+	int                  rtn;
+	struct sl_ctrl_lgrp  *ctrl_lgrp;
+	struct sl_ctrl_link *ctrl_link;
+
+	ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "missing lgrp (lgrp_num = %u)", lgrp_num);
+		return -EBADRQC;
+	}
+
+	spin_lock(&ctrl_links_lock);
+	ctrl_link = ctrl_links[ldev_num][lgrp_num][link_num];
+	spin_unlock(&ctrl_links_lock);
+	if (ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "new - link exists");
+		return -EBADRQC;
+	}
+
+	ctrl_link = kzalloc(sizeof(struct sl_ctrl_link), GFP_KERNEL);
+	if (!ctrl_link)
+		return -ENOMEM;
+
+	ctrl_link->magic    = SL_CTRL_LINK_MAGIC;
+	ctrl_link->ver      = SL_CTRL_LINK_VER;
+	ctrl_link->num      = link_num;
+	ctrl_link->ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+
+	kref_init(&ctrl_link->ref_cnt);
+	kref_init(&ctrl_link->mem_ref);
+	INIT_WORK(&ctrl_link->release_work, sl_ctrl_link_release_work);
+	mutex_init(&ctrl_link->delete_lock);
+	init_completion(&ctrl_link->del_complete);
+
+	spin_lock_init(&ctrl_link->config_lock);
+	spin_lock_init(&ctrl_link->data_lock);
+
+	rtn = sl_ctrl_link_counters_init(ctrl_link);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"ctrl_link_counters_init failed [%d]", rtn);
+		goto out;
+	}
+
+	rtn = sl_ctrl_link_cause_counters_init(ctrl_link);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"ctrl_link_cause_counters_init failed [%d]", rtn);
+		goto out_counters;
+	}
+
+	rtn = sl_ctrl_link_an_cause_counters_init(ctrl_link);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"ctrl_link_an_cause_counters_init failed [%d]", rtn);
+		goto out_cause_counters;
+	}
+
+	ctrl_link->up_clock.start           = ktime_set(0, 0);
+	ctrl_link->up_clock.elapsed         = ktime_set(0, 0);
+	ctrl_link->up_clock.attempt_count   = 0;
+	ctrl_link->up_clock.attempt_start   = ktime_set(0, 0);
+	ctrl_link->up_clock.attempt_elapsed = ktime_set(0, 0);
+	spin_lock_init(&ctrl_link->up_clock.lock);
+
+	spin_lock_init(&ctrl_link->fec_data.lock);
+	timer_setup(&ctrl_link->fec_mon_timer, sl_ctrl_link_fec_mon_timer, 0);
+	spin_lock_init(&ctrl_link->fec_mon_timer_lock);
+	ctrl_link->fec_data.curr_ptr = &ctrl_link->fec_data.cntrs[0];
+	ctrl_link->fec_data.prev_ptr = &ctrl_link->fec_data.cntrs[1];
+	INIT_WORK(&ctrl_link->fec_mon_timer_work, sl_ctrl_link_fec_mon_timer_work);
+
+	spin_lock_init(&ctrl_link->fec_up_cache.lock);
+	spin_lock_init(&ctrl_link->fec_down_cache.lock);
+
+	ctrl_link->state = SL_LINK_STATE_DOWN;
+
+	rtn = sl_core_link_new(ldev_num, lgrp_num, link_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+				      "core_link_new failed [%d]", rtn);
+		goto out_an_counters;
+	}
+
+	if (sysfs_parent) {
+		ctrl_link->parent_kobj = sysfs_parent;
+
+		rtn = sl_sysfs_link_create(ctrl_link);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+					      "sysfs_link_create failed [%d]", rtn);
+			goto out_core_link;
+		}
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "new (link = 0x%p)", ctrl_link);
+
+	spin_lock(&ctrl_links_lock);
+	ctrl_links[ldev_num][lgrp_num][link_num] = ctrl_link;
+	spin_unlock(&ctrl_links_lock);
+
+	return 0;
+
+out_core_link:
+	sl_core_link_del(ldev_num, lgrp_num, link_num);
+out_an_counters:
+	sl_ctrl_link_an_cause_counters_del(ctrl_link);
+out_cause_counters:
+	sl_ctrl_link_cause_counters_del(ctrl_link);
+out_counters:
+	sl_ctrl_link_counters_del(ctrl_link);
+out:
+	kfree(ctrl_link);
+	return rtn;
+}
+
+static int sl_ctrl_link_down_cmd(struct sl_ctrl_link *ctrl_link)
+{
+	int rtn;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down cmd");
+
+	SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN_CMD);
+
+	sl_ctrl_link_up_clock_reset(ctrl_link);
+
+	sl_ctrl_link_fec_mon_stop(ctrl_link);
+	cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+
+	rtn = sl_core_link_an_lp_caps_stop(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+					   ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (rtn)
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+				       "del core_link_an_lp_caps_stop failed [%d]", rtn);
+
+	rtn = sl_core_link_down(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num, ctrl_link->num,
+				sl_ctrl_link_down_callback, ctrl_link, SL_LINK_DOWN_CAUSE_COMMAND_MAP);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "core_link_down failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+
+static int sl_ctrl_link_cancel_cmd(struct sl_ctrl_link *ctrl_link)
+{
+	int rtn;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "cancel cmd");
+
+	SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_CANCEL_CMD);
+
+	sl_ctrl_link_fec_mon_stop(ctrl_link);
+	cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+
+	rtn = sl_core_link_an_lp_caps_stop(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+					   ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (rtn)
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+				       "del core_link_an_lp_caps_stop failed [%d]", rtn);
+
+	rtn = sl_core_link_cancel(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num, ctrl_link->num,
+				  sl_ctrl_link_down_callback, ctrl_link);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "core_link_down failed [%d]", rtn);
+		return rtn;
+	}
+
+	return 0;
+}
+
+static void sl_ctrl_link_down_wait(struct sl_ctrl_link *ctrl_link)
+{
+	unsigned long timeleft;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down wait");
+
+	timeleft = wait_for_completion_timeout(&ctrl_link->down_complete,
+					       msecs_to_jiffies(SL_CTRL_LINK_DOWN_WAIT_TIMEOUT_MS));
+	if (timeleft == 0)
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"del completion_timeout (down_complete = 0x%p)",
+			&ctrl_link->down_complete);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "del completion (timeleft = %lu)", timeleft);
+}
+
+static void sl_ctrl_link_free(struct kref *kref)
+{
+	kfree(container_of(kref, struct sl_ctrl_link, mem_ref));
+}
+
+static void sl_ctrl_link_release_work(struct work_struct *work)
+{
+	struct sl_ctrl_link *ctrl_link;
+	u32                  link_state;
+	u8                   ldev_num;
+	u8                   lgrp_num;
+	u8                   link_num;
+	int                  rtn;
+
+	ctrl_link = container_of(work, struct sl_ctrl_link, release_work);
+	ldev_num = ctrl_link->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = ctrl_link->ctrl_lgrp->num;
+	link_num = ctrl_link->num;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "release (link = 0x%p)", ctrl_link);
+
+	spin_lock(&ctrl_link->data_lock);
+	link_state = ctrl_link->state;
+	switch (link_state) {
+	case SL_LINK_STATE_STARTING:
+		ctrl_link->is_canceled = true;
+		spin_unlock(&ctrl_link->data_lock);
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_CANCEL_CMD);
+		sl_ctrl_link_cancel_cmd(ctrl_link);
+		sl_ctrl_link_down_wait(ctrl_link);
+		break;
+	case SL_LINK_STATE_UP:
+	case SL_LINK_STATE_UP_DOWN_REQ:
+		ctrl_link->state = SL_LINK_STATE_STOPPING;
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "release stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		sl_ctrl_link_down_cmd(ctrl_link);
+		sl_ctrl_link_down_wait(ctrl_link);
+		break;
+	case SL_LINK_STATE_STOPPING:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "release already stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		sl_ctrl_link_down_wait(ctrl_link);
+		break;
+	case SL_LINK_STATE_DOWN:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "release already down");
+		spin_unlock(&ctrl_link->data_lock);
+		break;
+	case SL_LINK_STATE_INVALID:
+	default:
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "release invalid state (link_state = %u %s)",
+				link_state, sl_link_state_str(link_state));
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EBUSY;
+		goto out_retry;
+	}
+
+	spin_lock(&ctrl_link->data_lock);
+	link_state = ctrl_link->state;
+	spin_unlock(&ctrl_link->data_lock);
+	if (link_state != SL_LINK_STATE_DOWN) {
+		rtn = -EBUSY;
+		goto out_retry;
+	}
+
+	if (!ctrl_link->sysfs_deleted) {
+		/* Must delete sysfs first to guarantee nobody is reading */
+		sl_sysfs_link_delete(ctrl_link);
+		ctrl_link->sysfs_deleted = true;
+	}
+
+	rtn = sl_core_link_del(ldev_num, lgrp_num, link_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+				      "release - core_link_del failed [%d]", rtn);
+		goto out_retry;
+	}
+
+	sl_ctrl_link_counters_del(ctrl_link);
+	sl_ctrl_link_cause_counters_del(ctrl_link);
+	sl_ctrl_link_an_cause_counters_del(ctrl_link);
+
+	spin_lock(&ctrl_links_lock);
+	ctrl_links[ldev_num][lgrp_num][link_num] = NULL;
+	spin_unlock(&ctrl_links_lock);
+
+	ctrl_link->delete_result = 0;
+	complete_all(&ctrl_link->del_complete);
+
+	kref_put(&ctrl_link->mem_ref, sl_ctrl_link_free);
+	return;
+
+out_retry:
+	spin_lock(&ctrl_links_lock);
+	ctrl_link->delete_result = rtn;
+	kref_init(&ctrl_link->ref_cnt);
+	ctrl_link->delete_requested = false;
+	complete_all(&ctrl_link->del_complete);
+	spin_unlock(&ctrl_links_lock);
+}
+
+static void sl_ctrl_link_release(struct kref *kref)
+{
+	struct sl_ctrl_link *ctrl_link = container_of(kref, struct sl_ctrl_link, ref_cnt);
+
+	queue_work(system_unbound_wq, &ctrl_link->release_work);
+}
+
+int sl_ctrl_link_put(struct sl_ctrl_link *ctrl_link)
+{
+	return ctrl_link ? kref_put(&ctrl_link->ref_cnt, sl_ctrl_link_release) : 0;
+}
+
+int sl_ctrl_link_del(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_ctrl_link *ctrl_link;
+	unsigned long        timeleft;
+	bool                 drop_owner = false;
+	int                  rtn;
+
+	sl_ctrl_log_dbg(NULL, LOG_NAME, "link del (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+
+	spin_lock(&ctrl_links_lock);
+	ctrl_link = ctrl_links[ldev_num][lgrp_num][link_num];
+	if (ctrl_link)
+		kref_get(&ctrl_link->mem_ref);
+	spin_unlock(&ctrl_links_lock);
+	if (!ctrl_link) {
+		sl_ctrl_log_err_trace(NULL, LOG_NAME,
+				      "link del link not found (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	mutex_lock(&ctrl_link->delete_lock);
+	spin_lock(&ctrl_links_lock);
+	if (!ctrl_link->delete_requested) {
+		ctrl_link->delete_requested = true;
+		reinit_completion(&ctrl_link->del_complete);
+		drop_owner = true;
+	}
+	spin_unlock(&ctrl_links_lock);
+	if (drop_owner)
+		sl_ctrl_link_put(ctrl_link);
+
+	timeleft = wait_for_completion_timeout(&ctrl_link->del_complete,
+					       msecs_to_jiffies(SL_CTRL_LINK_DEL_WAIT_TIMEOUT_MS));
+	rtn = timeleft ? ctrl_link->delete_result : -ETIMEDOUT;
+	mutex_unlock(&ctrl_link->delete_lock);
+	kref_put(&ctrl_link->mem_ref, sl_ctrl_link_free);
+	return rtn;
+}
+
+bool sl_ctrl_link_kref_get_unless_zero(struct sl_ctrl_link *ctrl_link)
+{
+	return (kref_get_unless_zero(&ctrl_link->ref_cnt) != 0);
+}
+
+struct sl_ctrl_link *sl_ctrl_link_get(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_ctrl_link *ctrl_link;
+
+	spin_lock(&ctrl_links_lock);
+	ctrl_link = ctrl_links[ldev_num][lgrp_num][link_num];
+	if (ctrl_link && (ctrl_link->delete_requested ||
+			  !kref_get_unless_zero(&ctrl_link->ref_cnt)))
+		ctrl_link = NULL;
+	spin_unlock(&ctrl_links_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (link = 0x%p)", ctrl_link);
+
+	return ctrl_link;
+}
+
+static int sl_ctrl_link_config_set_cmd(struct sl_ctrl_link *ctrl_link, struct sl_link_config *link_config)
+{
+	struct sl_core_link_config core_link_config;
+	int                        rtn;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "config set cmd");
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  link_up_timeout                = %ums",
+			link_config->link_up_timeout_ms);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  link_up_tries_max              = %d",
+			link_config->link_up_tries_max);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_up_settle_wait             = %dms",
+			link_config->fec_up_settle_wait_ms);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_up_check_wait              = %dms",
+			link_config->fec_up_check_wait_ms);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_up_ucw_limit               = %d",
+			link_config->fec_up_ucw_limit);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_up_ccw_limit               = %d",
+			link_config->fec_up_ccw_limit);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  pml_rec_timeout                = %ums",
+			link_config->pml_rec_timeout_ms);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  pml_rec_rate_limit_max_time    = %ums",
+			link_config->pml_rec_rate_limit_max_time_ms);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  pml_rec_rate_limit_window_size = %ums",
+			link_config->pml_rec_rate_limit_window_size_ms);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  pause_map                      = 0x%X",
+			link_config->pause_map);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  hpe_map                        = 0x%X",
+			link_config->hpe_map);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  options                        = 0x%X",
+			link_config->options);
+
+	/* Check if the configuration is locked. If we are performing an admin operation, then we can ignore the
+	 * lock bit and continue to write the config.
+	 */
+	spin_lock(&ctrl_link->config_lock);
+	if (!(link_config->options & SL_LINK_CONFIG_OPT_ADMIN) &&
+	    (ctrl_link->config.options & SL_LINK_CONFIG_OPT_LOCK)) {
+		sl_ctrl_log_info(ctrl_link, LOG_NAME, "link config locked (options: 0x%X)", ctrl_link->config.options);
+		spin_unlock(&ctrl_link->config_lock);
+		return 0;
+	}
+	spin_unlock(&ctrl_link->config_lock);
+
+	/* Admin bit is transient */
+	link_config->options &= ~SL_LINK_CONFIG_OPT_ADMIN;
+
+	if ((!link_config->fec_up_settle_wait_ms && link_config->fec_up_check_wait_ms) ||
+	    (link_config->fec_up_settle_wait_ms && !link_config->fec_up_check_wait_ms)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "fec_up invalid (settle_wait = %ums, check_wait = %ums)",
+				link_config->fec_up_settle_wait_ms, link_config->fec_up_check_wait_ms);
+		return -EINVAL;
+	}
+
+	core_link_config.magic                = SL_CORE_LINK_CONFIG_MAGIC;
+	core_link_config.fault_start_callback = sl_ctrl_link_fault_start_callback;
+	core_link_config.fault_callback       = sl_ctrl_link_fault_callback;
+
+	/* timeouts */
+	core_link_config.link_up_timeout_ms = link_config->link_up_timeout_ms;
+
+	/* fec config */
+	core_link_config.fec_up_settle_wait_ms = link_config->fec_up_settle_wait_ms;
+	core_link_config.fec_up_check_wait_ms  = link_config->fec_up_check_wait_ms;
+	core_link_config.fec_up_ucw_limit      = link_config->fec_up_ucw_limit;
+	core_link_config.fec_up_ccw_limit      = link_config->fec_up_ccw_limit;
+
+	/* pml recovery config */
+	core_link_config.pml_rec_timeout_ms                = link_config->pml_rec_timeout_ms;
+	core_link_config.pml_rec_rate_limit_max_time_ms    = link_config->pml_rec_rate_limit_max_time_ms;
+	core_link_config.pml_rec_rate_limit_window_size_ms = link_config->pml_rec_rate_limit_window_size_ms;
+
+	/* maps */
+	core_link_config.hpe_map   = link_config->hpe_map;
+	core_link_config.pause_map = link_config->pause_map;
+
+	/* flags */
+	core_link_config.flags = link_config->options;
+
+	rtn = sl_core_link_config_set(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				      ctrl_link->ctrl_lgrp->num, ctrl_link->num, &core_link_config);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+				      "core_link_config_set failed [%d]", rtn);
+		return rtn;
+	}
+
+	spin_lock(&ctrl_link->config_lock);
+	ctrl_link->config = *link_config;
+	spin_unlock(&ctrl_link->config_lock);
+
+	if (ctrl_link->config.link_up_tries_max == SL_LINK_INFINITE_UP_TRIES)
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "link up tries set to infinite");
+
+	return 0;
+}
+
+int sl_ctrl_link_config_set(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			    struct sl_link_config *link_config)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	u32                  link_state;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"config set NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "config set link ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	rtn = sl_ctrl_data_link_state_get(ctrl_link, &link_state);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "data_link_state_get failed [%d]", rtn);
+		goto out;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "config set (link_state = %u %s)",
+			link_state, sl_link_state_str(link_state));
+
+	switch (link_state) {
+	case SL_LINK_STATE_DOWN:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "config - set");
+		rtn = sl_ctrl_link_config_set_cmd(ctrl_link, link_config);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "link_config_set_cmd failed [%d]", rtn);
+			goto out;
+		}
+
+		rtn = 0;
+		goto out;
+	case SL_LINK_STATE_STARTING:
+	case SL_LINK_STATE_INVALID:
+	case SL_LINK_STATE_STOPPING:
+	case SL_LINK_STATE_UP:
+	case SL_LINK_STATE_UP_DOWN_REQ:
+	default:
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "config - invalid (link_state = %u %s)",
+				link_state, sl_link_state_str(link_state));
+		rtn = -EBADRQC;
+		goto out;
+	}
+
+out:
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "config - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+int sl_ctrl_link_policy_set(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			    struct sl_link_policy *link_policy)
+{
+	int                         rtn;
+	u32                         link_state;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	struct sl_core_link_policy  core_link_policy;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"policy set NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "policy set link ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	/* Check if the policy is locked. If we are performing an admin operation, then we can ignore the
+	 * lock bit and continue to write the config.
+	 */
+	spin_lock(&ctrl_link->config_lock);
+	if (!(link_policy->options & SL_LINK_POLICY_OPT_ADMIN) &&
+	    (ctrl_link->policy.options & SL_LINK_POLICY_OPT_LOCK)) {
+		sl_ctrl_log_info(ctrl_link, LOG_NAME, "link policy locked (options: 0x%X)", ctrl_link->policy.options);
+		spin_unlock(&ctrl_link->config_lock);
+		rtn = 0;
+		goto out;
+	}
+	spin_unlock(&ctrl_link->config_lock);
+
+	/* Admin bit is transient */
+	link_policy->options &= ~SL_LINK_POLICY_OPT_ADMIN;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "policy set");
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_mon_ucw_down_limit = %d", link_policy->fec_mon_ucw_down_limit);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_mon_ucw_warn_limit = %d", link_policy->fec_mon_ucw_warn_limit);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_mon_ccw_down_limit = %d", link_policy->fec_mon_ccw_down_limit);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_mon_ccw_warn_limit = %d", link_policy->fec_mon_ccw_warn_limit);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  fec_mon_period         = %dms", link_policy->fec_mon_period_ms);
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "  options                = 0x%X", link_policy->options);
+
+	spin_lock(&ctrl_link->config_lock);
+	ctrl_link->policy = *link_policy;
+	spin_unlock(&ctrl_link->config_lock);
+
+	core_link_policy.options = link_policy->options;
+	rtn = sl_core_link_policy_set(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num, ctrl_link->num,
+				      &core_link_policy);
+	if (rtn) {
+		sl_core_log_err(ctrl_link, LOG_NAME, "core link policy set failed [%d]", rtn);
+		rtn = -EBADRQC;
+		goto out;
+	}
+
+	rtn = sl_ctrl_data_link_state_get(ctrl_link, &link_state);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "data link state get failed [%d]", rtn);
+		goto out;
+	}
+
+	if ((link_state != SL_LINK_STATE_UP) && (link_state != SL_LINK_STATE_UP_DOWN_REQ)) {
+		sl_core_log_dbg(ctrl_link, LOG_NAME, "link_policy_set not up (link_state = %u %s)", link_state,
+				sl_core_link_state_str(link_state));
+		rtn = 0;
+		goto out;
+	}
+
+	sl_ctrl_link_fec_mon_start(ctrl_link);
+
+	rtn = 0;
+
+out:
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "policy set - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+int sl_ctrl_link_an_lp_caps_get(u8 ldev_num, u8 lgrp_num, u8 link_num,
+				struct sl_link_caps *caps, u32 timeout_ms, u32 flags)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"caps get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "caps get link ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an lp caps get");
+
+	rtn = sl_core_link_an_lp_caps_get(ldev_num, lgrp_num, link_num,
+					  sl_ctrl_link_an_lp_caps_get_callback, ctrl_link, caps, timeout_ms, flags);
+	if (rtn)
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+				      "core_link_an_lp_caps_get failed [%d]", rtn);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an lp caps get - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+int sl_ctrl_link_an_lp_caps_stop(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"caps stop NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "caps stop link ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an lp caps stop");
+
+	rtn = sl_core_link_an_lp_caps_stop(ldev_num, lgrp_num, link_num);
+	if (rtn)
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+				      "core_link_an_lp_caps_stop failed [%d]", rtn);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an lp caps stop - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+static int sl_ctrl_link_up_cmd(struct sl_ctrl_link *ctrl_link)
+{
+	int rtn;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up cmd");
+
+	SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_CMD);
+
+	sl_ctrl_link_up_clock_start(ctrl_link);
+
+	sl_ctrl_link_is_canceled_set(ctrl_link, false);
+
+	init_completion(&ctrl_link->down_complete);
+
+	sl_ctrl_link_up_clock_attempt_start(ctrl_link);
+
+	rtn = sl_core_link_up(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num, ctrl_link->num,
+			      sl_ctrl_link_up_callback, ctrl_link);
+	if (rtn) {
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_STOPPING);
+
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "core_link_up failed [%d]", rtn);
+
+		sl_ctrl_link_up_clock_reset(ctrl_link);
+
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+
+		return rtn;
+	}
+
+	return 0;
+}
+
+int sl_ctrl_link_up(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	u32                  link_state;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"link up NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "link up ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up");
+
+	spin_lock(&ctrl_link->data_lock);
+	link_state = ctrl_link->state;
+	switch (link_state) {
+	case SL_LINK_STATE_DOWN:
+		ctrl_link->state = SL_LINK_STATE_STARTING;
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up - starting");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = sl_ctrl_link_up_cmd(ctrl_link);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "link_up_cmd failed [%d]", rtn);
+			goto out;
+		}
+
+		rtn = 0;
+		goto out;
+	case SL_LINK_STATE_STARTING:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up - already starting");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EINPROGRESS;
+		goto out;
+	case SL_LINK_STATE_UP:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up - already up");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EALREADY;
+		goto out;
+	case SL_LINK_STATE_UP_DOWN_REQ:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up - already up down requested");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EALREADY;
+		goto out;
+	case SL_LINK_STATE_STOPPING:
+	case SL_LINK_STATE_INVALID:
+	default:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up - invalid (link_state = %u %s)",
+				link_state, sl_link_state_str(link_state));
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EBADRQC;
+		goto out;
+	}
+
+out:
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+int sl_ctrl_link_down(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	u32                  link_state;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"link down NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "link down ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down");
+
+	spin_lock(&ctrl_link->data_lock);
+	link_state = ctrl_link->state;
+	switch (link_state) {
+	case SL_LINK_STATE_STARTING:
+		ctrl_link->state = SL_LINK_STATE_STOPPING;
+		ctrl_link->is_canceled = true;
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - canceling");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = sl_ctrl_link_cancel_cmd(ctrl_link);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "cancel_cmd failed [%d]", rtn);
+			goto out;
+		}
+
+		rtn = 0;
+		goto out;
+	case SL_LINK_STATE_UP:
+	case SL_LINK_STATE_UP_DOWN_REQ:
+		ctrl_link->state = SL_LINK_STATE_STOPPING;
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = sl_ctrl_link_down_cmd(ctrl_link);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "down_cmd failed [%d]", rtn);
+			goto out;
+		}
+
+		rtn = 0;
+		goto out;
+	case SL_LINK_STATE_DOWN:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - already down");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EALREADY;
+		goto out;
+	case SL_LINK_STATE_STOPPING:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - already stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EINPROGRESS;
+		goto out;
+	case SL_LINK_STATE_INVALID:
+	default:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - invalid (link_state = %u %s)",
+				link_state, sl_link_state_str(link_state));
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EBADRQC;
+		goto out;
+	}
+
+out:
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+static int sl_ctrl_link_reset_cmd(struct sl_ctrl_link *ctrl_link)
+{
+	int           rtn;
+	u8            ldev_num;
+	u8            lgrp_num;
+	u8            link_num;
+	unsigned long timeleft;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "reset cmd");
+
+	SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_RESET_CMD);
+
+	sl_ctrl_link_up_clock_reset(ctrl_link);
+
+	sl_ctrl_link_fec_mon_stop(ctrl_link);
+	cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+
+	ldev_num = ctrl_link->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = ctrl_link->ctrl_lgrp->num;
+	link_num = ctrl_link->num;
+
+	rtn = sl_core_llr_stop(ldev_num, lgrp_num, link_num);
+	if (rtn)
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "core_llr_stop failed [%d]", rtn);
+
+	rtn = sl_core_mac_tx_stop(ldev_num, lgrp_num, link_num);
+	if (rtn)
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "core_mac_tx_stop failed [%d]", rtn);
+
+	rtn = sl_core_mac_rx_stop(ldev_num, lgrp_num, link_num);
+	if (rtn)
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "core_mac_rx_stop failed [%d]", rtn);
+
+	rtn = sl_core_link_down(ldev_num, lgrp_num, link_num, sl_ctrl_link_down_callback,
+				ctrl_link, SL_LINK_DOWN_CAUSE_COMMAND_MAP);
+	if (rtn)
+		sl_ctrl_log_warn(ctrl_link, LOG_NAME, "core_link_down failed [%d]", rtn);
+
+	timeleft = wait_for_completion_timeout(&ctrl_link->down_complete,
+					       msecs_to_jiffies(SL_CTRL_LINK_DOWN_WAIT_TIMEOUT_MS));
+	if (timeleft == 0)
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"completion_timeout (down_complete = 0x%p)", &ctrl_link->down_complete);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "completion (timeleft = %lu)", timeleft);
+
+	sl_core_link_reset(ldev_num, lgrp_num, link_num);
+
+	return 0;
+}
+
+int sl_ctrl_link_reset(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	u32                  link_state;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"link reset NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "link reset ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "reset");
+
+	spin_lock(&ctrl_link->data_lock);
+	link_state = ctrl_link->state;
+	switch (link_state) {
+	case SL_LINK_STATE_STARTING:
+		ctrl_link->is_canceled = true;
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_CANCEL_CMD);
+		fallthrough;
+	case SL_LINK_STATE_UP:
+	case SL_LINK_STATE_UP_DOWN_REQ:
+		ctrl_link->state = SL_LINK_STATE_STOPPING;
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "reset - stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = sl_ctrl_link_reset_cmd(ctrl_link);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "link_reset_cmd failed [%d]", rtn);
+			goto out;
+		}
+
+		rtn = 0;
+		goto out;
+	case SL_LINK_STATE_DOWN:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "reset - already down");
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = 0;
+		goto out;
+	case SL_LINK_STATE_STOPPING:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - already stopping");
+		spin_unlock(&ctrl_link->data_lock);
+
+		rtn = 0;
+		goto out;
+	case SL_LINK_STATE_INVALID:
+	default:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "reset - invalid (link_state = %u %s)",
+				link_state, sl_link_state_str(link_state));
+		spin_unlock(&ctrl_link->data_lock);
+		rtn = -EBADRQC;
+		goto out;
+	}
+
+out:
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "reset - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+int sl_ctrl_link_up_clocks_get(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			       s64 *attempt_time, s64 *total_time, s64 *up_time)
+{
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"clocks get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+				ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "clocks get link ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	spin_lock(&ctrl_link->up_clock.lock);
+
+	if (!ktime_compare(ctrl_link->up_clock.attempt_start, ktime_set(0, 0)))
+		*attempt_time = ktime_to_ms(ctrl_link->up_clock.attempt_elapsed);
+	else
+		*attempt_time = ktime_to_ms(ktime_sub(ktime_get(), ctrl_link->up_clock.attempt_start));
+
+	if (!ktime_compare(ctrl_link->up_clock.start, ktime_set(0, 0)))
+		*total_time = ktime_to_ms(ctrl_link->up_clock.elapsed);
+	else
+		*total_time = ktime_to_ms(ktime_sub(ktime_get(), ctrl_link->up_clock.start));
+
+	if (!ktime_compare(ctrl_link->up_clock.up, ktime_set(0, 0)))
+		*up_time = 0;
+	else
+		*up_time = ktime_to_ms(ktime_sub(ktime_get(), ctrl_link->up_clock.up));
+
+	spin_unlock(&ctrl_link->up_clock.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"clocks get (attempt_time = %lld, total_time = %lld)", *attempt_time, *total_time);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "clocks get - link removed (link = 0x%p)", ctrl_link);
+
+	return 0;
+}
+
+int sl_ctrl_link_up_count_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u32 *attempt_count)
+{
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"count get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+				ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "count get link ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	spin_lock(&ctrl_link->up_clock.lock);
+	*attempt_count = ctrl_link->up_clock.attempt_count;
+	spin_unlock(&ctrl_link->up_clock.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "count get (attempt_count = %u)", *attempt_count);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "count get - link removed (link = 0x%p)", ctrl_link);
+
+	return 0;
+}
+
+int sl_ctrl_link_state_get_cmd(u8 ldev_num, u8 lgrp_num, u8 link_num, u32 *state)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	*state = SL_LINK_STATE_INVALID;
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"state get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return 0;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "state get kref unavailable (ctrl_link = 0x%p)", ctrl_link);
+		return -EBADRQC;
+	}
+
+	rtn = sl_ctrl_data_link_state_get(ctrl_link, state);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "data_link_state_get failed [%d]", rtn);
+		goto out;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"state get (state = %u %s)",
+		*state, sl_link_state_str(*state));
+
+out:
+	sl_ctrl_link_put(ctrl_link);
+
+	return rtn;
+}
+
+int sl_ctrl_link_an_lp_caps_state_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u32 *state)
+{
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"an lp caps state get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EINVAL;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"an lp caps state get kref unavailable (ctrl_link = 0x%p)", ctrl_link);
+		return -EBADRQC;
+	}
+
+	*state = sl_core_link_an_lp_caps_state_get(ldev_num, lgrp_num, link_num);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an lp caps state get - link removed (link = 0x%p)", ctrl_link);
+
+	return 0;
+}
+
+int sl_ctrl_link_an_fail_cause_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u32 *fail_cause, time64_t *fail_time)
+{
+	int    rtn;
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"an fail cause get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+				ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"an fail cause get kref unavailable (ctrl_link = 0x%p)", ctrl_link);
+		return -EBADRQC;
+	}
+
+	rtn = sl_core_link_an_fail_cause_get(ldev_num, lgrp_num, link_num, fail_cause, fail_time);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an fail cause get - link removed (link = 0x%p)", ctrl_link);
+
+	return rtn;
+}
+
+u32 sl_ctrl_link_an_retry_count_get(struct sl_ctrl_link *ctrl_link, int *count)
+{
+	*count = sl_core_link_an_retry_count_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+						 ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an retry get (count = %d)", *count);
+
+	return 0;
+}
+
+int sl_ctrl_link_info_map_get(u8 ldev_num, u8 lgrp_num, u8 link_num, u64 *info_map)
+{
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"info map get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "info map get ref unavailable (ctrl_link = 0x%p)",
+				ctrl_link);
+		return -EBADRQC;
+	}
+
+	*info_map = sl_core_link_info_map_get(ldev_num, lgrp_num, link_num);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "info map get - link removed (link = 0x%p)", ctrl_link);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_counters.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_counters.c
new file mode 100644
index 000000000000..1de7d93033b9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_counters.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_link_counters.h"
+#include "base/sl_ctrl_log.h"
+#include "hw/sl_core_hw_an.h"
+
+#define LOG_NAME SL_CTRL_LINK_LOG_NAME
+
+#define SL_CTRL_LINK_COUNTER_INIT(_link, _counter) \
+	(_link)->counters[_counter].name = #_counter
+
+#define SL_CTRL_LINK_CAUSE_COUNTER_INIT(_link, _counter) \
+	(_link)->cause_counters[_counter].name = #_counter
+
+#define SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(_link, _counter) \
+	(_link)->an_cause_counters[_counter].name = #_counter
+
+int sl_ctrl_link_counters_init(struct sl_ctrl_link *ctrl_link)
+{
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "link counters init");
+
+	ctrl_link->counters = kzalloc(sizeof(struct sl_ctrl_link_counter) * SL_CTRL_LINK_COUNTERS_COUNT, GFP_KERNEL);
+	if (!ctrl_link->counters)
+		return -ENOMEM;
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP_CMD);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP_RETRY);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP_FAIL);
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_DOWN_CMD);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_DOWN);
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP_CANCEL_CMD);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP_CANCELED);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_RESET_CMD);
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_FAULT_ASYNC);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_RECOVERING);
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_CCW_WARN_CROSSED);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UCW_WARN_CROSSED);
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_DOWN_CCW_LIMIT_CROSSED);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_DOWN_UCW_LIMIT_CROSSED);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_DOWN_CCW_CAUSE);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_DOWN_UCW_CAUSE);
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP_FAIL_CCW_LIMIT_CROSSED);
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_UP_FAIL_UCW_LIMIT_CROSSED);
+
+	SL_CTRL_LINK_COUNTER_INIT(ctrl_link, LINK_HW_AN_ATTEMPT);
+
+	return 0;
+}
+
+int sl_ctrl_link_counters_get(struct sl_ctrl_link *ctrl_link, u32 counter, int *count)
+{
+	*count = atomic_read(&ctrl_link->counters[counter].count);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (counter = %u %s, count = %d)", counter,
+			ctrl_link->counters[counter].name, *count);
+
+	return 0;
+}
+
+void sl_ctrl_link_counters_del(struct sl_ctrl_link *ctrl_link)
+{
+	kfree(ctrl_link->counters);
+}
+
+int sl_ctrl_link_cause_counters_init(struct sl_ctrl_link *ctrl_link)
+{
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "link cause counters init");
+
+	ctrl_link->cause_counters = kzalloc(sizeof(*ctrl_link->cause_counters) *
+					    SL_CTRL_LINK_CAUSE_COUNTERS_COUNT, GFP_KERNEL);
+	if (!ctrl_link->cause_counters)
+		return -ENOMEM;
+
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_UCW);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_LF);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_RF);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_DOWN);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_UP_TRIES);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_AUTONEG_NOMATCH);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_AUTONEG);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_CONFIG);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_INTR_ENABLE);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_TIMEOUT);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_CANCELED);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_UNSUPPORTED_CABLE);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_COMMAND);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_DOWNSHIFT);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_LLR_REPLAY_MAX);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_UPSHIFT);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_AUTONEG_CONFIG);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_PCS_FAULT);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_SERDES_PLL);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_SERDES_CONFIG);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_SERDES_SIGNAL);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_SERDES_QUALITY);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_NO_MEDIA);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_CCW);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_MEDIA_HOT);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_MEDIA_WARM);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_INTR_REGISTER);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_MEDIA_ERROR);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_UP_CANCELED);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_UNSUPPORTED_SPEED);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_SS200_CABLE);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_TX_LOL);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_RX_LOL);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_TX_LOS);
+	SL_CTRL_LINK_CAUSE_COUNTER_INIT(ctrl_link, LINK_CAUSE_RX_LOS);
+
+	return 0;
+}
+
+int sl_ctrl_link_cause_counters_get(struct sl_ctrl_link *ctrl_link, u32 counter, int *count)
+{
+	*count = atomic_read(&ctrl_link->cause_counters[counter].count);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (cause counter = %u %s, count = %d)", counter,
+			ctrl_link->cause_counters[counter].name, *count);
+
+	return 0;
+}
+
+void sl_ctrl_link_cause_counters_del(struct sl_ctrl_link *ctrl_link)
+{
+	kfree(ctrl_link->cause_counters);
+}
+
+int sl_ctrl_link_an_cause_counters_init(struct sl_ctrl_link *ctrl_link)
+{
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "link an cause counters init");
+
+	ctrl_link->an_cause_counters = kzalloc(sizeof(*ctrl_link->an_cause_counters) *
+					    SL_CTRL_LINK_AN_CAUSE_COUNTERS_COUNT, GFP_KERNEL);
+	if (!ctrl_link->an_cause_counters)
+		return -ENOMEM;
+
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_LP_CAPS_SERDES_LINK_UP_FAIL);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_LP_CAPS_NOT_COMPLETE);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_NOT_COMPLETE);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_TEST_CAPS_NOMATCH);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_SERDES_LINK_UP_FAIL);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_BP_STORE_STATE_BAD);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_BP_STORE_LP_ABILITY_NOT_SET);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_BP_STORE_STATE_ERROR);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_BP_STORE_BP_NOT_SET);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_BP_SEND_INTR_ENABLE_FAIL);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_NP_STORE_STATE_BAD);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_NP_STORE_BP_SET);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_NP_CHECK_STATE_BAD);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_INTR_STATE_INVALID);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_INTR_AN_RETRY_NP_SEND_FAIL);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_INTR_OUT_OF_PAGES);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_INTR_NP_SEND_FAIL);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_FAIL);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_NO_BP);
+	SL_CTRL_LINK_AN_CAUSE_COUNTER_INIT(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_OUI_INVALID);
+
+	return 0;
+}
+
+int sl_ctrl_link_an_cause_counters_get(struct sl_ctrl_link *ctrl_link, u32 counter, int *count)
+{
+	*count = atomic_read(&ctrl_link->an_cause_counters[counter].count);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "get (an cause counter = %u %s, count = %d)", counter,
+			ctrl_link->an_cause_counters[counter].name, *count);
+
+	return 0;
+}
+
+void sl_ctrl_link_an_cause_counters_del(struct sl_ctrl_link *ctrl_link)
+{
+	kfree(ctrl_link->an_cause_counters);
+}
+
+void sl_ctrl_link_cause_counter_inc(struct sl_ctrl_link *ctrl_link, u64 cause_map)
+{
+	unsigned long which;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "link cause counter inc");
+
+	for_each_set_bit(which, (unsigned long *)&cause_map, sizeof(cause_map) * BITS_PER_BYTE) {
+		switch (BIT(which)) {
+		case SL_LINK_DOWN_CAUSE_UCW:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_UCW);
+			break;
+		case SL_LINK_DOWN_CAUSE_LF:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_LF);
+			break;
+		case SL_LINK_DOWN_CAUSE_RF:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_RF);
+			break;
+		case SL_LINK_DOWN_CAUSE_DOWN:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_DOWN);
+			break;
+		case SL_LINK_DOWN_CAUSE_UP_TRIES:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_UP_TRIES);
+			break;
+		case SL_LINK_DOWN_CAUSE_AUTONEG_NOMATCH:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_AUTONEG_NOMATCH);
+			break;
+		case SL_LINK_DOWN_CAUSE_AUTONEG:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_AUTONEG);
+			break;
+		case SL_LINK_DOWN_CAUSE_CONFIG:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_CONFIG);
+			break;
+		case SL_LINK_DOWN_CAUSE_INTR_ENABLE:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_INTR_ENABLE);
+			break;
+		case SL_LINK_DOWN_CAUSE_TIMEOUT:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_TIMEOUT);
+			break;
+		case SL_LINK_DOWN_CAUSE_CANCELED:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_CANCELED);
+			break;
+		case SL_LINK_DOWN_CAUSE_UNSUPPORTED_CABLE:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_UNSUPPORTED_CABLE);
+			break;
+		case SL_LINK_DOWN_CAUSE_COMMAND:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_COMMAND);
+			break;
+		case SL_LINK_DOWN_CAUSE_DOWNSHIFT:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_DOWNSHIFT);
+			break;
+		case SL_LINK_DOWN_CAUSE_LLR_REPLAY_MAX:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_LLR_REPLAY_MAX);
+			break;
+		case SL_LINK_DOWN_CAUSE_UPSHIFT:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_UPSHIFT);
+			break;
+		case SL_LINK_DOWN_CAUSE_AUTONEG_CONFIG:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_AUTONEG_CONFIG);
+			break;
+		case SL_LINK_DOWN_CAUSE_PCS_FAULT:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_PCS_FAULT);
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_PLL:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_SERDES_PLL);
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_CONFIG:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_SERDES_CONFIG);
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_SIGNAL:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_SERDES_SIGNAL);
+			break;
+		case SL_LINK_DOWN_CAUSE_SERDES_QUALITY:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_SERDES_QUALITY);
+			break;
+		case SL_LINK_DOWN_CAUSE_NO_MEDIA:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_NO_MEDIA);
+			break;
+		case SL_LINK_DOWN_CAUSE_CCW:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_CCW);
+			break;
+		case SL_LINK_DOWN_CAUSE_MEDIA_HOT:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_MEDIA_HOT);
+			break;
+		case SL_LINK_DOWN_CAUSE_MEDIA_WARM:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_MEDIA_WARM);
+			break;
+		case SL_LINK_DOWN_CAUSE_INTR_REGISTER:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_INTR_REGISTER);
+			break;
+		case SL_LINK_DOWN_CAUSE_MEDIA_ERROR:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_MEDIA_ERROR);
+			break;
+		case SL_LINK_DOWN_CAUSE_UP_CANCELED:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_UP_CANCELED);
+			break;
+		case SL_LINK_DOWN_CAUSE_UNSUPPORTED_SPEED:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_UNSUPPORTED_SPEED);
+			break;
+		case SL_LINK_DOWN_CAUSE_SS200_CABLE:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_SS200_CABLE);
+			break;
+		case SL_LINK_DOWN_CAUSE_TX_LOL:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_TX_LOL);
+			break;
+		case SL_LINK_DOWN_CAUSE_RX_LOL:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_RX_LOL);
+			break;
+		case SL_LINK_DOWN_CAUSE_TX_LOS:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_TX_LOS);
+			break;
+		case SL_LINK_DOWN_CAUSE_RX_LOS:
+			SL_CTRL_LINK_CAUSE_COUNTER_INC(ctrl_link, LINK_CAUSE_RX_LOS);
+			break;
+		case SL_LINK_DOWN_RETRYABLE:
+		case SL_LINK_DOWN_ORIGIN_ASYNC:
+		case SL_LINK_DOWN_ORIGIN_LINK_UP:
+			break;
+		default:
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "cause_counter_inc unknown cause (bit = %lu)", which);
+			break;
+		}
+	}
+}
+
+void sl_ctrl_link_an_cause_counter_inc(struct sl_ctrl_link *ctrl_link, unsigned long cause_map)
+{
+	unsigned long which;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "link an cause counter inc");
+
+	BUILD_BUG_ON(SL_CTRL_LINK_AN_CAUSE_COUNTERS_COUNT > 32);
+
+	for_each_set_bit(which, &cause_map, sizeof(cause_map) * BITS_PER_BYTE) {
+		switch (BIT(which)) {
+		case SL_CORE_HW_AN_FAIL_CAUSE_LP_CAPS_SERDES_LINK_UP_FAIL:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_LP_CAPS_SERDES_LINK_UP_FAIL);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_LP_CAPS_NOT_COMPLETE:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_LP_CAPS_NOT_COMPLETE);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_NOT_COMPLETE:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_NOT_COMPLETE);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_TEST_CAPS_NOMATCH:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_TEST_CAPS_NOMATCH);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_SERDES_LINK_UP_FAIL:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_SERDES_LINK_UP_FAIL);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_STATE_BAD:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_BP_STORE_STATE_BAD);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_LP_ABILITY_NOT_SET:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_BP_STORE_LP_ABILITY_NOT_SET);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_STATE_ERROR:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_BP_STORE_STATE_ERROR);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_BP_STORE_BP_NOT_SET:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_BP_STORE_BP_NOT_SET);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_BP_SEND_INTR_ENABLE_FAIL:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_BP_SEND_INTR_ENABLE_FAIL);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_NP_STORE_STATE_BAD:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_NP_STORE_STATE_BAD);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_NP_STORE_BP_SET:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_NP_STORE_BP_SET);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_NP_CHECK_STATE_BAD:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_NP_CHECK_STATE_BAD);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_INTR_STATE_INVALID:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_INTR_STATE_INVALID);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_INTR_AN_RETRY_NP_SEND_FAIL:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_INTR_AN_RETRY_NP_SEND_FAIL);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_INTR_OUT_OF_PAGES:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_INTR_OUT_OF_PAGES);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_INTR_NP_SEND_FAIL:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_INTR_NP_SEND_FAIL);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_FAIL:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_FAIL);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_NO_BP:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_NO_BP);
+			break;
+		case SL_CORE_HW_AN_FAIL_CAUSE_PAGES_DECODE_OUI_INVALID:
+			SL_CTRL_LINK_AN_CAUSE_COUNTER_INC(ctrl_link, LINK_AN_CAUSE_PAGES_DECODE_OUI_INVALID);
+			break;
+		default:
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "an cause_counter_inc unknown fault cause (bit = %lu)", which);
+			break;
+		}
+	}
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c
new file mode 100644
index 000000000000..2c54795281e0
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_link_fec.h"
+#include "sl_core_link.h"
+
+#define LOG_NAME SL_CTRL_LINK_FEC_LOG_NAME
+
+int sl_ctrl_link_fec_info_get(u8 ldev_num, u8 lgrp_num, u8 link_num, struct sl_fec_info *fec_info)
+{
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	int                 x;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"info get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"fec info get kref unavailable (ctrl_link = 0x%p)", ctrl_link);
+		return -EBADRQC;
+	}
+
+	*fec_info = sl_ctrl_link_fec_data_info_get(ctrl_link);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"info get (ucw = %llu, ccw = %llu, gcw = %llu, period = %ums)",
+		fec_info->ucw, fec_info->ccw, fec_info->gcw, fec_info->period_ms);
+	for (x = 0; x < SL_CTRL_NUM_FEC_LANES; ++x)
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "info get (lane %d = 0x%llX)", x, fec_info->lanes[x]);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "fec info get - link removed (link = 0x%p)", ctrl_link);
+
+	return 0;
+}
+
+int sl_ctrl_link_fec_tail_get(u8 ldev_num, u8 lgrp_num, u8 link_num, struct sl_fec_tail *fec_tail)
+{
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+	int                 x;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"tail get NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"fec tail get kref unavailable (ctrl_link = 0x%p)", ctrl_link);
+		return -EBADRQC;
+	}
+
+	*fec_tail = sl_ctrl_link_fec_data_tail_get(ctrl_link);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "tail get (period = %ums))", fec_tail->period_ms);
+	for (x = 0; x < SL_CTRL_NUM_CCW_BINS; ++x)
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "tail get (bin %d = %llu)", x, fec_tail->ccw_bins[x]);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "fec tail get - link removed (link = 0x%p)", ctrl_link);
+
+	return 0;
+}
+
+int sl_ctrl_link_fec_data_get(u8 ldev_num, u8 lgrp_num, u8 link_num,
+			      struct sl_core_link_fec_cw_cntrs *cw_cntrs,
+			      struct sl_core_link_fec_lane_cntrs *lane_cntrs,
+			      struct sl_core_link_fec_tail_cntrs *tail_cntrs)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	held_link_1 = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!held_link_1)
+		return -ENODEV;
+	return sl_core_link_fec_data_get(held_link_1, cw_cntrs, lane_cntrs,
+					 tail_cntrs);
+}
+
+int sl_ctrl_link_fec_mon_state_get(struct sl_ctrl_link *ctrl_link, u32 *state)
+{
+	spin_lock(&ctrl_link->fec_mon_timer_lock);
+	*state = ctrl_link->fec_mon_state;
+	spin_unlock(&ctrl_link->fec_mon_timer_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "fec monitor (state = %u, %s)", *state,
+			sl_ctrl_link_fec_mon_state_str(*state));
+
+	return 0;
+}
+
+const char *sl_ctrl_link_fec_mon_state_str(u32 state)
+{
+	switch (state) {
+	case SL_CTRL_LINK_FEC_MON_OFF:
+		return "off";
+	case SL_CTRL_LINK_FEC_MON_ON:
+		return "on";
+	default:
+		return "unknown";
+	}
+}
+
+//#define SL_CTRL_SERDES_RATE_25	25781250000
+//#define SL_CTRL_SERDES_RATE_50	53125000000
+//#define SL_CTRL_SERDES_RATE_100	106250000000
+
+/* CCW BER Calculation Multiplier (10^6). */
+#define SL_CTRL_LINK_FEC_CCW_BER_MULT 1000000
+#define SL_CTRL_LINK_FEC_CCW_BER_EXP 6
+
+/* UCW BER Calculation Multiplier (10^12). */
+#define SL_CTRL_LINK_FEC_UCW_BER_MULT 1000000000000
+#define SL_CTRL_LINK_FEC_UCW_BER_EXP 12
+
+#define MAX_CCW_COUNT (U64_MAX / (HZ * SL_CTRL_LINK_FEC_CCW_BER_MULT))
+#define MAX_UCW_COUNT (U64_MAX / (HZ * SL_CTRL_LINK_FEC_UCW_BER_MULT))
+
+int sl_ctrl_link_fec_ber_calc(struct sl_fec_info *fec_info, struct sl_ber *ucw_ber, struct sl_ber *ccw_ber)
+{
+	u64 total;
+	u64 ccw_rate;	/* Rate * 10^10 */
+	u64 ucw_rate;	/* Rate * 10^10 */
+	int mag;
+
+	sl_ctrl_log_dbg(NULL, LOG_NAME, "fec_ber_calc");
+
+	/* Total must be > 0 to calculate */
+	total = fec_info->ccw + fec_info->gcw;
+	if (total == 0) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"fec invalid (total = %llu)", total);
+		return -EINVAL;
+	}
+
+	if (fec_info->ccw > MAX_CCW_COUNT) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"fec ccw invalid (%llu > %llu)", fec_info->ccw, MAX_CCW_COUNT);
+		return -EINVAL;
+	}
+
+	if (fec_info->ucw > MAX_UCW_COUNT) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"fec ucw invalid (%llu > %llu)", fec_info->ucw, MAX_UCW_COUNT);
+		return -EINVAL;
+	}
+
+	/* B = BER
+	 * n = [U/C]CW count
+	 * g = Good CW count
+	 * T = total CW = ccw_count + g
+	 * t = time = (jiffies / HZ)
+	 *
+	 * B = (n/T) / t; B = (n * HZ) / (T * jiffies)
+	 */
+
+	/* We use RS(544/514) with 10 bit symbols which is a total of 5440 bits per CW. */
+	total = fec_info->ccw + (fec_info->gcw * 5440);
+
+	/* CCW count * CCW multiplier */
+	ccw_rate = (fec_info->ccw * HZ * SL_CTRL_LINK_FEC_CCW_BER_MULT) / (total * fec_info->period_ms);
+
+	/* Keep at least 2 significant digits */
+	mag = 0;
+	while ((ccw_rate / 100) > 9) {
+		ccw_rate /= 100;
+		mag += 2;
+	}
+
+	ccw_ber->mant = ccw_rate;
+	ccw_ber->exp = mag - SL_CTRL_LINK_FEC_CCW_BER_EXP;	/* Divide by CCW multiplier */
+
+	/* UCW count * UCW multiplier */
+	ucw_rate = (fec_info->ucw * HZ * SL_CTRL_LINK_FEC_UCW_BER_MULT) / (total * fec_info->period_ms);
+
+	/* Keep at least 2 significant digits */
+	mag = 0;
+	while ((ucw_rate / 100) > 9) {
+		ucw_rate /= 100;
+		mag += 2;
+	}
+
+	ucw_ber->mant = ucw_rate;
+	ucw_ber->exp = mag - SL_CTRL_LINK_FEC_UCW_BER_EXP;	/* Divide by UCW multiplier */
+
+	sl_ctrl_log_dbg(NULL, LOG_NAME, "fec_ber_calc (CCW = %ue%d, UCW = %ue%d)",
+			ccw_ber->mant, ccw_ber->exp, ucw_ber->mant, ucw_ber->exp);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c
new file mode 100644
index 000000000000..a1f50d1a3b3c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c
@@ -0,0 +1,539 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/string.h>
+#include <linux/spinlock.h>
+#include <linux/time.h>
+#include <linux/workqueue.h>
+
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_lgrp_notif.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_link_priv.h"
+#include "sl_ctrl_link_counters.h"
+#include "sl_ctrl_link_fec.h"
+#include "sl_ctrl_link_fec_priv.h"
+#include "sl_core_link.h"
+#include "sl_platform.h"
+
+#define SL_CTRL_LINK_UCW_LIMIT_MAX_CHANCES 2
+#define SL_CTRL_LINK_CCW_LIMIT_MAX_CHANCES 2
+#define SL_CTRL_LINK_FEC_MON_PERIOD_MS     500
+#define LOG_NAME SL_CTRL_LINK_FEC_LOG_NAME
+
+void sl_ctrl_link_fec_data_store(struct sl_ctrl_link *ctrl_link,
+				 struct sl_core_link_fec_cw_cntrs   *cw_cntrs,
+	struct sl_core_link_fec_lane_cntrs *lane_cntrs,
+	struct sl_core_link_fec_tail_cntrs *tail_cntrs)
+{
+	struct sl_ctrl_link_fec_cntrs *tmp_cntrs_ptr;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "data_store");
+
+	spin_lock(&ctrl_link->fec_data.lock);
+
+	tmp_cntrs_ptr = ctrl_link->fec_data.prev_ptr;
+	ctrl_link->fec_data.prev_ptr = ctrl_link->fec_data.curr_ptr;
+	ctrl_link->fec_data.curr_ptr = tmp_cntrs_ptr;
+
+	ctrl_link->fec_data.curr_ptr->cw_cntrs   = *cw_cntrs;
+	ctrl_link->fec_data.curr_ptr->lane_cntrs = *lane_cntrs;
+	ctrl_link->fec_data.curr_ptr->tail_cntrs = *tail_cntrs;
+	ctrl_link->fec_data.curr_ptr->timestamp  = jiffies;
+
+	spin_unlock(&ctrl_link->fec_data.lock);
+}
+
+void sl_ctrl_link_fec_up_cache_clear(struct sl_ctrl_link *ctrl_link)
+{
+	spin_lock(&ctrl_link->fec_up_cache.lock);
+	memset(&(ctrl_link->fec_up_cache.cw_cntrs),   0, sizeof(struct sl_core_link_fec_cw_cntrs));
+	memset(&(ctrl_link->fec_up_cache.lane_cntrs), 0, sizeof(struct sl_core_link_fec_lane_cntrs));
+	memset(&(ctrl_link->fec_up_cache.tail_cntrs), 0, sizeof(struct sl_core_link_fec_tail_cntrs));
+	spin_unlock(&ctrl_link->fec_up_cache.lock);
+}
+
+void sl_ctrl_link_fec_up_cache_store(struct sl_ctrl_link *ctrl_link,
+				     struct sl_core_link_fec_cw_cntrs   *cw_cntrs,
+	struct sl_core_link_fec_lane_cntrs *lane_cntrs,
+	struct sl_core_link_fec_tail_cntrs *tail_cntrs)
+{
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up_cache_store");
+
+	spin_lock(&ctrl_link->fec_up_cache.lock);
+	ctrl_link->fec_up_cache.cw_cntrs   = *cw_cntrs;
+	ctrl_link->fec_up_cache.lane_cntrs = *lane_cntrs;
+	ctrl_link->fec_up_cache.tail_cntrs = *tail_cntrs;
+	spin_unlock(&ctrl_link->fec_up_cache.lock);
+}
+
+void sl_ctrl_link_fec_down_cache_clear(struct sl_ctrl_link *ctrl_link)
+{
+	spin_lock(&ctrl_link->fec_down_cache.lock);
+	memset(&(ctrl_link->fec_down_cache.cw_cntrs),   0, sizeof(struct sl_core_link_fec_cw_cntrs));
+	memset(&(ctrl_link->fec_down_cache.lane_cntrs), 0, sizeof(struct sl_core_link_fec_lane_cntrs));
+	memset(&(ctrl_link->fec_down_cache.tail_cntrs), 0, sizeof(struct sl_core_link_fec_tail_cntrs));
+	spin_unlock(&ctrl_link->fec_down_cache.lock);
+}
+
+void sl_ctrl_link_fec_down_cache_store(struct sl_ctrl_link *ctrl_link,
+				       struct sl_core_link_fec_cw_cntrs   *cw_cntrs,
+	struct sl_core_link_fec_lane_cntrs *lane_cntrs,
+	struct sl_core_link_fec_tail_cntrs *tail_cntrs)
+{
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down_cache_store");
+
+	spin_lock(&ctrl_link->fec_down_cache.lock);
+	ctrl_link->fec_down_cache.cw_cntrs   = *cw_cntrs;
+	ctrl_link->fec_down_cache.lane_cntrs = *lane_cntrs;
+	ctrl_link->fec_down_cache.tail_cntrs = *tail_cntrs;
+	spin_unlock(&ctrl_link->fec_down_cache.lock);
+}
+
+static void sl_ctrl_link_fec_mon_limits_calc(struct sl_ctrl_link *ctrl_link)
+{
+	struct sl_link_policy link_policy;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "mon limits calc");
+
+	sl_ctrl_link_policy_get(ctrl_link, &link_policy);
+
+	spin_lock(&ctrl_link->fec_data.lock);
+
+	ctrl_link->fec_data.info.monitor.period_ms = (link_policy.fec_mon_period_ms < 0) ?
+		SL_CTRL_LINK_FEC_MON_PERIOD_MS : link_policy.fec_mon_period_ms;
+
+	if (link_policy.fec_mon_ccw_down_limit < 0)
+		ctrl_link->fec_data.info.monitor.ccw_down_limit = 0;
+	else
+		ctrl_link->fec_data.info.monitor.ccw_down_limit = link_policy.fec_mon_ccw_down_limit;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"mon limits calc (ccw_down_limit = %d)",
+		ctrl_link->fec_data.info.monitor.ccw_down_limit);
+
+	if (link_policy.fec_mon_ccw_warn_limit < 0)
+		ctrl_link->fec_data.info.monitor.ccw_warn_limit =
+			sl_ctrl_link_fec_limit_calc(ctrl_link,
+						    SL_CTRL_LINK_FEC_CCW_MANT, SL_CTRL_LINK_FEC_CCW_EXP) >> 1;
+	else
+		ctrl_link->fec_data.info.monitor.ccw_warn_limit = link_policy.fec_mon_ccw_warn_limit;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"mon limits calc (ccw_warn_limit = %d)",
+		ctrl_link->fec_data.info.monitor.ccw_warn_limit);
+
+	if (ctrl_link->fec_data.info.monitor.ccw_down_limit &&
+	    (ctrl_link->fec_data.info.monitor.ccw_warn_limit > ctrl_link->fec_data.info.monitor.ccw_down_limit))
+		sl_ctrl_log_warn(ctrl_link, LOG_NAME,
+				 "CCW warning limit set greater than down limit (%d > %d)",
+			ctrl_link->fec_data.info.monitor.ccw_warn_limit,
+			ctrl_link->fec_data.info.monitor.ccw_down_limit);
+
+	if (link_policy.fec_mon_ucw_down_limit < 0) {
+		ctrl_link->fec_data.info.monitor.ucw_down_limit =
+			sl_ctrl_link_fec_limit_calc(ctrl_link, SL_CTRL_LINK_FEC_UCW_MANT, SL_CTRL_LINK_FEC_UCW_EXP);
+	} else {
+		ctrl_link->fec_data.info.monitor.ucw_down_limit = link_policy.fec_mon_ucw_down_limit;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"mon limits calc (ucw_down_limit = %d)",
+		ctrl_link->fec_data.info.monitor.ucw_down_limit);
+
+	if (link_policy.fec_mon_ucw_warn_limit < 0)
+		ctrl_link->fec_data.info.monitor.ucw_warn_limit =
+			sl_ctrl_link_fec_limit_calc(ctrl_link, SL_CTRL_LINK_FEC_UCW_MANT,
+						    SL_CTRL_LINK_FEC_UCW_EXP) >> 1;
+	else
+		ctrl_link->fec_data.info.monitor.ucw_warn_limit = link_policy.fec_mon_ucw_warn_limit;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"mon limits calc (ucw_warn_limit = %d)",
+		ctrl_link->fec_data.info.monitor.ucw_warn_limit);
+
+	if (ctrl_link->fec_data.info.monitor.ucw_down_limit &&
+	    (ctrl_link->fec_data.info.monitor.ucw_warn_limit > ctrl_link->fec_data.info.monitor.ucw_down_limit))
+		sl_ctrl_log_warn(ctrl_link, LOG_NAME,
+				 "CCW warning limit set greater than down limit (%d > %d)",
+			ctrl_link->fec_data.info.monitor.ucw_warn_limit,
+			ctrl_link->fec_data.info.monitor.ucw_down_limit);
+
+	spin_unlock(&ctrl_link->fec_data.lock);
+}
+
+void sl_ctrl_link_fec_mon_start(struct sl_ctrl_link *ctrl_link)
+{
+	u32 period;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "mon_start");
+
+	sl_ctrl_link_fec_mon_limits_calc(ctrl_link);
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	period = ctrl_link->fec_data.info.monitor.period_ms;
+	spin_unlock(&ctrl_link->fec_data.lock);
+	if (!period) {
+		sl_ctrl_link_fec_mon_stop(ctrl_link);
+		cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+		return;
+	}
+
+	spin_lock(&ctrl_link->fec_mon_timer_lock);
+	ctrl_link->fec_mon_timer_stop = false;
+	ctrl_link->fec_mon_state = SL_CTRL_LINK_FEC_MON_ON;
+	mod_timer(&ctrl_link->fec_mon_timer, jiffies + msecs_to_jiffies(period));
+	spin_unlock(&ctrl_link->fec_mon_timer_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor timer started (period = %ums)", period);
+}
+
+void sl_ctrl_link_fec_data_calc(struct sl_ctrl_link *ctrl_link)
+{
+	int x;
+
+	spin_lock(&ctrl_link->fec_data.lock);
+
+	ctrl_link->fec_data.info.ccw =
+		ctrl_link->fec_data.curr_ptr->cw_cntrs.ccw - ctrl_link->fec_data.prev_ptr->cw_cntrs.ccw;
+	ctrl_link->fec_data.info.ucw =
+		ctrl_link->fec_data.curr_ptr->cw_cntrs.ucw - ctrl_link->fec_data.prev_ptr->cw_cntrs.ucw;
+	ctrl_link->fec_data.info.gcw =
+		ctrl_link->fec_data.curr_ptr->cw_cntrs.gcw - ctrl_link->fec_data.prev_ptr->cw_cntrs.gcw;
+	for (x = 0; x < SL_CORE_LINK_FEC_NUM_LANES; ++x)
+		ctrl_link->fec_data.info.lanes[x] = ctrl_link->fec_data.curr_ptr->lane_cntrs.lanes[x] -
+			ctrl_link->fec_data.prev_ptr->lane_cntrs.lanes[x];
+	ctrl_link->fec_data.info.period_ms =
+		jiffies_to_msecs(ctrl_link->fec_data.curr_ptr->timestamp - ctrl_link->fec_data.prev_ptr->timestamp);
+
+	for (x = 0; x < SL_CTRL_NUM_CCW_BINS; ++x)
+		ctrl_link->fec_data.tail.ccw_bins[x] = ctrl_link->fec_data.curr_ptr->tail_cntrs.ccw_bins[x] -
+			ctrl_link->fec_data.prev_ptr->tail_cntrs.ccw_bins[x];
+	ctrl_link->fec_data.tail.period_ms = ctrl_link->fec_data.info.period_ms;
+
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	if ((ctrl_link->fec_data.info.ccw > 0) || (ctrl_link->fec_data.info.ucw > 0)) {
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+				"data_calc (ccw = %llu, ucw = %llu, gcw = %llu, period = %ums)",
+			ctrl_link->fec_data.info.ccw, ctrl_link->fec_data.info.ucw,
+			ctrl_link->fec_data.info.gcw, ctrl_link->fec_data.info.period_ms);
+		for (x = 0; x < SL_CTRL_NUM_CCW_BINS; ++x)
+			sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+					"data_calc (bin %d = %llu)", x, ctrl_link->fec_data.tail.ccw_bins[x]);
+	}
+}
+
+struct sl_fec_info sl_ctrl_link_fec_data_info_get(struct sl_ctrl_link *ctrl_link)
+{
+	struct sl_fec_info fec_info;
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	fec_info = ctrl_link->fec_data.info;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	return fec_info;
+}
+
+struct sl_fec_tail sl_ctrl_link_fec_data_tail_get(struct sl_ctrl_link *ctrl_link)
+{
+	struct sl_fec_tail fec_tail;
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	fec_tail = ctrl_link->fec_data.tail;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	return fec_tail;
+}
+
+static bool sl_ctrl_link_fec_ucw_chance_limit_check(struct sl_ctrl_link *ctrl_link, s32 limit, struct sl_fec_info *info)
+{
+	if (SL_CTRL_LINK_FEC_UCW_LIMIT_CHECK(limit, info)) {
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN_UCW_LIMIT_CROSSED);
+		ctrl_link->fec_ucw_chance = ctrl_link->fec_ucw_chance + 1;
+	} else {
+		ctrl_link->fec_ucw_chance = 0;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "fec_ucw_chance_limit_check (limit = %d, UCW = %llu, ucw_chance = %u)",
+			limit, info->ucw, ctrl_link->fec_ucw_chance);
+
+	return ctrl_link->fec_ucw_chance > SL_CTRL_LINK_UCW_LIMIT_MAX_CHANCES;
+}
+
+static bool sl_ctrl_link_fec_ccw_chance_limit_check(struct sl_ctrl_link *ctrl_link, s32 limit, struct sl_fec_info *info)
+{
+	if (SL_CTRL_LINK_FEC_CCW_LIMIT_CHECK(limit, info)) {
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN_CCW_LIMIT_CROSSED);
+		ctrl_link->fec_ccw_chance = ctrl_link->fec_ccw_chance + 1;
+	} else {
+		ctrl_link->fec_ccw_chance = 0;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "fec_ccw_chance_limit_check (limit = %d, CCW = %llu, ccw_chance = %u)",
+			limit, info->ccw, ctrl_link->fec_ccw_chance);
+
+	return ctrl_link->fec_ccw_chance > SL_CTRL_LINK_CCW_LIMIT_MAX_CHANCES;
+}
+
+int sl_ctrl_link_fec_data_check(struct sl_ctrl_link *ctrl_link)
+{
+	int                rtn;
+	s32                ccw_down_limit;
+	s32                ccw_warn_limit;
+	s32                ucw_down_limit;
+	s32                ucw_warn_limit;
+	struct sl_fec_info fec_info;
+	bool               is_limit_crossed;
+	time64_t           limit_crossed_time;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "data check");
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	ccw_down_limit = ctrl_link->fec_data.info.monitor.ccw_down_limit;
+	ccw_warn_limit = ctrl_link->fec_data.info.monitor.ccw_warn_limit;
+	ucw_down_limit = ctrl_link->fec_data.info.monitor.ucw_down_limit;
+	ucw_warn_limit = ctrl_link->fec_data.info.monitor.ucw_warn_limit;
+	spin_unlock(&ctrl_link->fec_data.lock);
+
+	fec_info = ctrl_link->fec_data.info;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"data check config (ccw_down = %d, ucw_down = %d, ccw_warn = %d, ucw_warn = %d)",
+		ccw_down_limit, ucw_down_limit, ccw_warn_limit, ucw_warn_limit);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"data check info (UCW = %llu, CCW = %llu, GCW = %llu, period = %ums)",
+		fec_info.ucw, fec_info.ccw, fec_info.gcw, fec_info.period_ms);
+
+	if (sl_ctrl_link_fec_ucw_chance_limit_check(ctrl_link, ucw_down_limit, &fec_info)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"UCW exceeded down limit (UCW = %llu, CCW = %llu, ucw_chance = %u)",
+			fec_info.ucw, fec_info.ccw, ctrl_link->fec_ucw_chance);
+		ctrl_link->fec_ucw_chance = 0;
+		rtn = sl_ctrl_link_async_down(ctrl_link, SL_LINK_DOWN_CAUSE_UCW_MAP, false);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+					      "data check UCW ctrl_link_async_down failed [%d]", rtn);
+			return rtn;
+		}
+		return -EIO;
+	}
+
+	if (sl_ctrl_link_fec_ccw_chance_limit_check(ctrl_link, ccw_down_limit, &fec_info)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"CCW exceeded down limit (UCW = %llu, CCW = %llu, ccw_chance = %u)",
+			fec_info.ucw, fec_info.ccw, ctrl_link->fec_ccw_chance);
+		ctrl_link->fec_ccw_chance = 0;
+		rtn = sl_ctrl_link_async_down(ctrl_link, SL_LINK_DOWN_CAUSE_CCW_MAP, false);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+					      "data check CCW ctrl_link_async_down failed [%d]", rtn);
+			return rtn;
+		}
+		return -EIO;
+	}
+
+	if (SL_CTRL_LINK_FEC_UCW_LIMIT_CHECK(ucw_warn_limit, &fec_info)) {
+		rtn = sl_core_link_ucw_warn_limit_crossed_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+							      ctrl_link->ctrl_lgrp->num, ctrl_link->num, &is_limit_crossed, &limit_crossed_time);
+		if (rtn)
+			sl_core_log_warn_trace(ctrl_link, LOG_NAME, "ucw_warn_limit_crossed_get failed [%d]", rtn);
+
+		if (!is_limit_crossed) {
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "UCW exceeded warn limit (UCW = %llu, CCW = %llu)",
+					       fec_info.ucw, fec_info.ccw);
+			rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+							 SL_LGRP_NOTIF_LINK_UCW_WARN, NULL, 0);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+						       "data check ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		}
+		sl_core_link_ucw_warn_limit_crossed_set(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+							ctrl_link->ctrl_lgrp->num, ctrl_link->num, true);
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UCW_WARN_CROSSED);
+	}
+
+	if (SL_CTRL_LINK_FEC_CCW_LIMIT_CHECK(ccw_warn_limit, &fec_info)) {
+		rtn = sl_core_link_ccw_warn_limit_crossed_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+							      ctrl_link->ctrl_lgrp->num, ctrl_link->num, &is_limit_crossed, &limit_crossed_time);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "ccw_warn_limit_crossed_get failed [%d]", rtn);
+
+		if (!is_limit_crossed) {
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "CCW exceeded warn limit (UCW = %llu, CCW = %llu)",
+					       fec_info.ucw, fec_info.ccw);
+			rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+							 SL_LGRP_NOTIF_LINK_CCW_WARN, NULL, 0);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+						       "data check ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		}
+		sl_core_link_ccw_warn_limit_crossed_set(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+							ctrl_link->ctrl_lgrp->num, ctrl_link->num, true);
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_CCW_WARN_CROSSED);
+	}
+
+	return 0;
+}
+
+void sl_ctrl_link_fec_mon_timer_work(struct work_struct *work)
+{
+	struct sl_core_link *held_link_1 __free(sl_core_link_put) = NULL;
+	int                                  rtn;
+	struct sl_ctrl_link                 *ctrl_link;
+	u32                                  period;
+	bool                                 stop;
+	struct sl_core_link_fec_cw_cntrs     cw_cntrs;
+	struct sl_core_link_fec_lane_cntrs   lane_cntrs;
+	struct sl_core_link_fec_tail_cntrs   tail_cntrs;
+
+	ctrl_link = container_of(work, struct sl_ctrl_link, fec_mon_timer_work);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor timer work");
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	period = ctrl_link->fec_data.info.monitor.period_ms;
+	spin_unlock(&ctrl_link->fec_data.lock);
+	if (!period) {
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor period zero");
+		return;
+	}
+
+	held_link_1 = sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+				       ctrl_link->ctrl_lgrp->num, ctrl_link->num);
+	if (!held_link_1)
+		return;
+	if (sl_core_link_is_pml_recovery_running(held_link_1)) {
+		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "fec monitor skipped due to pml recovery running");
+		goto start_mon;
+	}
+
+	spin_lock(&ctrl_link->fec_mon_timer_lock);
+	stop = ctrl_link->fec_mon_timer_stop;
+	spin_unlock(&ctrl_link->fec_mon_timer_lock);
+	if (stop) {
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor stopped");
+		return;
+	}
+
+	rtn = sl_ctrl_link_fec_data_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+					ctrl_link->ctrl_lgrp->num, ctrl_link->num, &cw_cntrs, &lane_cntrs,
+					&tail_cntrs);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+				      "core_link_fec_tail_cntrs_get failed [%d]", rtn);
+		goto start_mon;
+	}
+
+	sl_ctrl_link_fec_data_store(ctrl_link, &cw_cntrs, &lane_cntrs, &tail_cntrs);
+
+	sl_ctrl_link_fec_data_calc(ctrl_link);
+
+	rtn = sl_ctrl_link_fec_data_check(ctrl_link);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "check failed [%d]", rtn);
+		return;
+	}
+
+	spin_lock(&ctrl_link->fec_data.lock);
+	period = ctrl_link->fec_data.info.monitor.period_ms;
+	spin_unlock(&ctrl_link->fec_data.lock);
+	if (!period) {
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor period zero");
+		return;
+	}
+
+	spin_lock(&ctrl_link->fec_mon_timer_lock);
+	stop = ctrl_link->fec_mon_timer_stop;
+	spin_unlock(&ctrl_link->fec_mon_timer_lock);
+	if (stop) {
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor stopped");
+		return;
+	}
+
+start_mon:
+	mod_timer(&ctrl_link->fec_mon_timer, jiffies + msecs_to_jiffies(period));
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor started");
+}
+
+void sl_ctrl_link_fec_mon_timer(struct timer_list *timer)
+{
+	struct sl_ctrl_link *ctrl_link;
+
+	ctrl_link = timer_container_of(ctrl_link, timer, fec_mon_timer);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor timer");
+
+	queue_work(ctrl_link->ctrl_lgrp->ctrl_ldev->workq, &ctrl_link->fec_mon_timer_work);
+}
+
+void sl_ctrl_link_fec_mon_stop(struct sl_ctrl_link *ctrl_link)
+{
+	bool stop;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor stop");
+
+	spin_lock(&ctrl_link->fec_mon_timer_lock);
+	stop = ctrl_link->fec_mon_timer_stop;
+	ctrl_link->fec_mon_timer_stop = true;
+	ctrl_link->fec_mon_state = SL_CTRL_LINK_FEC_MON_OFF;
+	spin_unlock(&ctrl_link->fec_mon_timer_lock);
+
+	if (stop) {
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor already stopped");
+		return;
+	}
+
+	timer_delete_sync(&ctrl_link->fec_mon_timer);
+}
+
+#define SL_CTRL_LINK_FEC_LIMIT_25   25781250000ULL
+#define SL_CTRL_LINK_FEC_LIMIT_50   53125000000ULL
+#define SL_CTRL_LINK_FEC_LIMIT_100 106250000000ULL
+u32 sl_ctrl_link_fec_limit_calc(struct sl_ctrl_link *ctrl_link, u32 mant, int exp)
+{
+	u64                 limit;
+	int                 x;
+	struct sl_link_caps link_caps;
+
+	sl_core_link_caps_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+			      ctrl_link->ctrl_lgrp->num, ctrl_link->num, &link_caps);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"fec limit calc (tech_map = 0x%X, mant = %u, exp = %d)",
+		link_caps.tech_map, mant, exp);
+
+	if (link_caps.tech_map & SL_LGRP_CONFIG_TECH_CK_400G)
+		limit = SL_CTRL_LINK_FEC_LIMIT_100 << 2;
+	else if (link_caps.tech_map & SL_LGRP_CONFIG_TECH_CK_200G)
+		limit = SL_CTRL_LINK_FEC_LIMIT_100 << 1;
+	else if (link_caps.tech_map & SL_LGRP_CONFIG_TECH_BS_200G)
+		limit = SL_CTRL_LINK_FEC_LIMIT_50 << 2;
+	else if (link_caps.tech_map & SL_LGRP_CONFIG_TECH_CK_100G)
+		limit = SL_CTRL_LINK_FEC_LIMIT_100;
+	else if (link_caps.tech_map & SL_LGRP_CONFIG_TECH_BJ_100G)
+		limit = SL_CTRL_LINK_FEC_LIMIT_25 << 2;
+	else if (link_caps.tech_map & SL_LGRP_CONFIG_TECH_CD_100G)
+		limit = SL_CTRL_LINK_FEC_LIMIT_50 << 1;
+	else if (link_caps.tech_map & SL_LGRP_CONFIG_TECH_CD_50G)
+		limit = SL_CTRL_LINK_FEC_LIMIT_50;
+	else
+		limit = SL_CTRL_LINK_FEC_LIMIT_100;
+
+	limit *= mant;
+	for (x = exp; x < 0; ++x)
+		limit /= 10;
+
+	if (limit > INT_MAX)
+		return INT_MAX;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"fec limit calc (limit = %llu)", limit);
+
+	return limit;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c
new file mode 100644
index 000000000000..252673b57a0b
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c
@@ -0,0 +1,865 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+
+#include <linux/hpe/sl/sl_link.h>
+
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_lgrp_notif.h"
+#include "sl_ctrl_link.h"
+#include "sl_ctrl_link_priv.h"
+#include "sl_ctrl_link_counters.h"
+#include "sl_core_link.h"
+#include "sl_core_link_an.h"
+#include "sl_core_str.h"
+
+#define LOG_NAME SL_CTRL_LINK_LOG_NAME
+
+#define SL_LINK_DOWN_CAUSE_FATAL_MASK (                \
+		SL_LINK_DOWN_CAUSE_AUTONEG_NOMATCH   | \
+		SL_LINK_DOWN_CAUSE_CONFIG            | \
+		SL_LINK_DOWN_CAUSE_DOWNSHIFT         | \
+		SL_LINK_DOWN_CAUSE_INTR_ENABLE       | \
+		SL_LINK_DOWN_CAUSE_UNSUPPORTED_CABLE | \
+		SL_LINK_DOWN_CAUSE_SS200_CABLE       | \
+		SL_LINK_DOWN_CAUSE_UCW               | \
+		SL_LINK_DOWN_CAUSE_MEDIA_HOT         | \
+		SL_LINK_DOWN_CAUSE_MEDIA_WARM        | \
+		SL_LINK_DOWN_CAUSE_NO_MEDIA          | \
+		SL_LINK_DOWN_CAUSE_UPSHIFT)
+
+void sl_ctrl_link_is_canceled_set(struct sl_ctrl_link *ctrl_link, bool canceled)
+{
+	spin_lock(&ctrl_link->data_lock);
+	ctrl_link->is_canceled = canceled;
+	spin_unlock(&ctrl_link->data_lock);
+}
+
+bool sl_ctrl_link_is_canceled(struct sl_ctrl_link *ctrl_link)
+{
+	bool is_canceled;
+
+	spin_lock(&ctrl_link->data_lock);
+	is_canceled = ctrl_link->is_canceled;
+	spin_unlock(&ctrl_link->data_lock);
+
+	return is_canceled;
+}
+
+static void sl_ctrl_link_last_up_fail_cause_map_clr(struct sl_ctrl_link *ctrl_link)
+{
+	spin_lock(&ctrl_link->data_lock);
+	ctrl_link->last_up_fail_cause_map = 0;
+	ctrl_link->last_up_fail_time      = 0;
+	spin_unlock(&ctrl_link->data_lock);
+}
+
+static void sl_ctrl_link_last_up_fail_cause_map_set(struct sl_ctrl_link *ctrl_link, u64 last_up_fail_cause_map)
+{
+	spin_lock(&ctrl_link->data_lock);
+	ctrl_link->last_up_fail_cause_map |= last_up_fail_cause_map;
+	ctrl_link->last_up_fail_time       = ktime_get_real_seconds();
+	spin_unlock(&ctrl_link->data_lock);
+}
+
+static bool sl_ctrl_link_is_last_up_fail_cause_set(struct sl_ctrl_link *ctrl_link, u64 last_up_fail_cause)
+{
+	bool is_last_up_fail_cause_set;
+
+	spin_lock(&ctrl_link->data_lock);
+	is_last_up_fail_cause_set = ctrl_link->last_up_fail_cause_map & last_up_fail_cause;
+	spin_unlock(&ctrl_link->data_lock);
+
+	return is_last_up_fail_cause_set;
+}
+
+static int sl_ctrl_link_up_notif_send(struct sl_ctrl_lgrp *ctrl_lgrp, struct sl_ctrl_link *ctrl_link,
+				      u64 info_map, u32 speed, u32 fec_mode, u32 fec_type)
+{
+	union sl_lgrp_notif_info info;
+
+	info.link_up.mode     = speed;
+	info.link_up.fec_mode = fec_mode;
+	info.link_up.fec_type = fec_type;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up notif send (speed = %u %s, fec mode = %u %s, fec type = %u)",
+			speed, sl_lgrp_config_tech_str(speed), fec_mode, sl_lgrp_fec_mode_str(fec_mode), fec_type);
+
+	return sl_ctrl_lgrp_notif_enqueue(ctrl_lgrp, ctrl_link->num, SL_LGRP_NOTIF_LINK_UP,
+		&info, info_map);
+}
+
+static int sl_ctrl_link_up_fail_notif_send(struct sl_ctrl_lgrp *ctrl_lgrp, struct sl_ctrl_link *ctrl_link,
+					   u64 cause_map, u64 info_map)
+{
+	union sl_lgrp_notif_info info;
+
+	info.cause_map = cause_map;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up fail notif send (cause_map = 0x%llX)", cause_map);
+
+	return sl_ctrl_lgrp_notif_enqueue(ctrl_lgrp, ctrl_link->num, SL_LGRP_NOTIF_LINK_UP_FAIL,
+		&info, info_map);
+}
+
+static int sl_ctrl_async_link_down_notif_send(struct sl_ctrl_link *ctrl_link, u64 cause_map, u64 info_map)
+{
+	union sl_lgrp_notif_info info;
+	char                     cause_str[SL_LINK_DOWN_CAUSE_STR_SIZE];
+
+	info.cause_map = cause_map;
+
+	sl_link_down_cause_map_with_info_str(cause_map, cause_str, sizeof(cause_str));
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"async_link_down_notif_send (core_cause_map = 0x%llX %s)", cause_map, cause_str);
+
+	return sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+		SL_LGRP_NOTIF_LINK_ASYNC_DOWN, &info, info_map);
+}
+
+static int sl_ctrl_link_down_notif_send(struct sl_ctrl_link *ctrl_link, u64 cause_map, u64 info_map)
+{
+	union sl_lgrp_notif_info info;
+	char                     cause_str[SL_LINK_DOWN_CAUSE_STR_SIZE];
+
+	info.cause_map = cause_map;
+
+	sl_link_down_cause_map_with_info_str(cause_map, cause_str, sizeof(cause_str));
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"link_down_notif_send (core_cause_map = 0x%llX %s)", cause_map, cause_str);
+
+	return sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+		SL_LGRP_NOTIF_LINK_DOWN, &info, info_map);
+}
+
+static int sl_ctrl_link_down_req_notif_send(struct sl_ctrl_link *ctrl_link, u64 cause_map, u64 info_map)
+{
+	union sl_lgrp_notif_info info;
+	char                     cause_str[SL_LINK_DOWN_CAUSE_STR_SIZE];
+
+	info.cause_map = cause_map;
+
+	sl_link_down_cause_map_with_info_str(cause_map, cause_str, sizeof(cause_str));
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"link_down_req_notif_send (core_cause_map = 0x%llX %s)", cause_map, cause_str);
+
+	return sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+					  SL_LGRP_NOTIF_LINK_DOWN_REQ, &info, info_map);
+}
+
+void sl_ctrl_link_up_clock_start(struct sl_ctrl_link *ctrl_link)
+{
+	spin_lock(&ctrl_link->up_clock.lock);
+	ctrl_link->up_clock.start         = ktime_get();
+	ctrl_link->up_clock.elapsed       = ktime_set(0, 0);
+	ctrl_link->up_clock.attempt_count = 0;
+	spin_unlock(&ctrl_link->up_clock.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"clock start (time = %lld)", ctrl_link->up_clock.start);
+}
+
+static void sl_ctrl_link_up_clock_stop(struct sl_ctrl_link *ctrl_link)
+{
+	spin_lock(&ctrl_link->up_clock.lock);
+	ctrl_link->up_clock.elapsed = ktime_sub(ktime_get(), ctrl_link->up_clock.start);
+	ctrl_link->up_clock.start   = ktime_set(0, 0);
+	ctrl_link->up_clock.up      = ktime_get();
+	spin_unlock(&ctrl_link->up_clock.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"clock stop (time = %lld)", ctrl_link->up_clock.elapsed);
+}
+
+void sl_ctrl_link_up_clock_reset(struct sl_ctrl_link *ctrl_link)
+{
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "clock reset");
+
+	spin_lock(&ctrl_link->up_clock.lock);
+	ctrl_link->up_clock.elapsed         = ktime_set(0, 0);
+	ctrl_link->up_clock.start           = ktime_set(0, 0);
+	ctrl_link->up_clock.attempt_count   = 0;
+	ctrl_link->up_clock.attempt_elapsed = ktime_set(0, 0);
+	ctrl_link->up_clock.attempt_start   = ktime_set(0, 0);
+	ctrl_link->up_clock.up              = ktime_set(0, 0);
+	spin_unlock(&ctrl_link->up_clock.lock);
+}
+
+void sl_ctrl_link_up_clock_attempt_start(struct sl_ctrl_link *ctrl_link)
+{
+	spin_lock(&ctrl_link->up_clock.lock);
+	ctrl_link->up_clock.attempt_start   = ktime_get();
+	ctrl_link->up_clock.attempt_elapsed = ktime_set(0, 0);
+	ctrl_link->up_clock.attempt_count++;
+	spin_unlock(&ctrl_link->up_clock.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"clock attempt start (time = %lld)", ctrl_link->up_clock.attempt_start);
+}
+
+static void sl_ctrl_link_up_clock_attempt_stop(struct sl_ctrl_link *ctrl_link)
+{
+	spin_lock(&ctrl_link->up_clock.lock);
+	ctrl_link->up_clock.attempt_elapsed = ktime_sub(ktime_get(), ctrl_link->up_clock.attempt_start);
+	ctrl_link->up_clock.attempt_start   = ktime_set(0, 0);
+	spin_unlock(&ctrl_link->up_clock.lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"clock attempt stop (time = %lld)", ctrl_link->up_clock.attempt_elapsed);
+}
+
+static void sl_ctrl_link_state_stopping_set(struct sl_ctrl_link *ctrl_link)
+{
+	u32           link_state;
+
+	spin_lock(&ctrl_link->data_lock);
+	link_state = ctrl_link->state;
+	switch (link_state) {
+	case SL_LINK_STATE_STOPPING:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "stopping set - already stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		return;
+	case SL_LINK_STATE_STARTING:
+	case SL_LINK_STATE_UP:
+	case SL_LINK_STATE_UP_DOWN_REQ:
+		ctrl_link->state = SL_LINK_STATE_STOPPING;
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "stopping set - stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		return;
+	default:
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "stopping set - invalid state (link_state = %u %s)",
+				link_state, sl_link_state_str(link_state));
+		spin_unlock(&ctrl_link->data_lock);
+		return;
+	}
+}
+
+int sl_ctrl_link_up_callback(void *tag, struct sl_core_link_up_info *up_info)
+{
+	struct sl_ctrl_link         *ctrl_link;
+	char                         core_imap_str[SL_LINK_INFO_STRLEN];
+	int                          max_up_tries;
+	u32                          up_count;
+	int                          rtn;
+	s64                          attempt_time;
+	s64                          total_time;
+	s64                          up_time;
+	union sl_lgrp_notif_info     info;
+	struct sl_core_link_up_info  core_link_up_info;
+	u64			     up_fail_cause_map;
+
+	ctrl_link = tag;
+	core_link_up_info = *up_info;
+
+	sl_core_info_map_str(core_link_up_info.info_map, core_imap_str, sizeof(core_imap_str));
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"up callback (core_state = %u %s, core_cause_map = 0x%llX, info_map = %s (0x%llx))",
+		core_link_up_info.state, sl_core_link_state_str(core_link_up_info.state),
+		core_link_up_info.cause_map, core_imap_str, core_link_up_info.info_map);
+
+	sl_ctrl_link_last_up_fail_cause_map_clr(ctrl_link);
+	sl_ctrl_link_last_up_fail_cause_map_set(ctrl_link, core_link_up_info.cause_map);
+
+	sl_ctrl_link_up_clock_attempt_stop(ctrl_link);
+
+	switch (core_link_up_info.state) {
+	case SL_CORE_LINK_STATE_UP:
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP);
+		sl_ctrl_link_up_clock_stop(ctrl_link);
+
+		rtn = sl_ctrl_link_up_clocks_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+						 ctrl_link->num, &attempt_time, &total_time, &up_time);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "link_up_clocks_get failed [%d]", rtn);
+
+		rtn = sl_ctrl_link_up_count_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+						ctrl_link->num, &up_count);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "link_up_count_get failed [%d]", rtn);
+
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+				"up callback (count = %d, attempt_time = %lldms, total_time = %lldms)",
+			up_count, attempt_time, total_time);
+
+		sl_ctrl_link_fec_mon_start(ctrl_link);
+
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_UP);
+
+		rtn = sl_ctrl_link_up_notif_send(ctrl_link->ctrl_lgrp, ctrl_link, core_link_up_info.info_map,
+						 core_link_up_info.speed, core_link_up_info.fec_mode, core_link_up_info.fec_type);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "up callback ctrl_link_up_notif_send failed [%d]", rtn);
+		return 0;
+
+	case SL_CORE_LINK_STATE_DOWN:
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_FAIL);
+
+		spin_lock(&ctrl_link->config_lock);
+		max_up_tries = ctrl_link->config.link_up_tries_max;
+		spin_unlock(&ctrl_link->config_lock);
+
+		/* canceled */
+		if (sl_ctrl_link_is_canceled(ctrl_link)) {
+			sl_ctrl_link_up_clock_reset(ctrl_link);
+
+			sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up retry canceled");
+
+			sl_ctrl_link_state_stopping_set(ctrl_link);
+
+			flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+			sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+			complete_all(&ctrl_link->down_complete);
+
+			rtn = sl_ctrl_link_last_up_fail_cause_map_get(ctrl_link, &up_fail_cause_map);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "last_up_fail_cause_map_get failed [%d]", rtn);
+
+			rtn = sl_ctrl_link_up_fail_notif_send(ctrl_link->ctrl_lgrp, ctrl_link,
+							      up_fail_cause_map, core_link_up_info.info_map);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+						       "up callback work ctrl_link_up_fail_notif_send failed [%d]", rtn);
+
+			return 0;
+		}
+
+		/* check up tries */
+		rtn = sl_ctrl_link_up_count_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+						ctrl_link->ctrl_lgrp->num, ctrl_link->num, &up_count);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "link_up_count_get failed [%d]", rtn);
+
+		if ((up_count >= max_up_tries) && (max_up_tries != SL_LINK_INFINITE_UP_TRIES)) {
+			sl_ctrl_link_up_clock_reset(ctrl_link);
+
+			sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up callback work out of up tries");
+
+			sl_ctrl_link_state_stopping_set(ctrl_link);
+
+			sl_ctrl_link_last_up_fail_cause_map_set(ctrl_link, SL_LINK_DOWN_CAUSE_UP_TRIES_MAP);
+
+			flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+			sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+
+			complete_all(&ctrl_link->down_complete);
+
+			rtn = sl_ctrl_link_last_up_fail_cause_map_get(ctrl_link, &up_fail_cause_map);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "last_up_fail_cause_map_get failed [%d]", rtn);
+			rtn = sl_ctrl_link_up_fail_notif_send(ctrl_link->ctrl_lgrp, ctrl_link,
+							      up_fail_cause_map, core_link_up_info.info_map);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+						       "up callback work ctrl_link_up_fail_notif_send failed [%d]", rtn);
+			return 0;
+		}
+
+		/* check fatal down causes */
+		if (sl_ctrl_link_is_last_up_fail_cause_set(ctrl_link, SL_LINK_DOWN_CAUSE_FATAL_MASK)) {
+			sl_ctrl_link_up_clock_reset(ctrl_link);
+
+			sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "up callback work fatal down cause");
+
+			sl_ctrl_link_state_stopping_set(ctrl_link);
+
+			flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+
+			sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+			complete_all(&ctrl_link->down_complete);
+
+			rtn = sl_ctrl_link_last_up_fail_cause_map_get(ctrl_link, &up_fail_cause_map);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "last_up_fail_cause_map_get failed [%d]", rtn);
+			rtn = sl_ctrl_link_up_fail_notif_send(ctrl_link->ctrl_lgrp, ctrl_link,
+							      up_fail_cause_map, core_link_up_info.info_map);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+						       "up callback work ctrl_link_up_fail_notif_send failed [%d]", rtn);
+
+			return 0;
+		}
+
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "link up retry (ctrl_link = 0x%p)", ctrl_link);
+
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_RETRY);
+
+		sl_ctrl_link_up_clock_attempt_start(ctrl_link);
+
+		rtn = sl_core_link_up(ctrl_link->ctrl_lgrp->ctrl_ldev->num, ctrl_link->ctrl_lgrp->num,
+				      ctrl_link->num, sl_ctrl_link_up_callback, ctrl_link);
+		if (rtn) {
+			sl_ctrl_link_up_clock_reset(ctrl_link);
+
+			sl_ctrl_link_state_stopping_set(ctrl_link);
+
+			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
+					      "up callback work core_link_up failed [%d]", rtn);
+
+			flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+			sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+
+			complete_all(&ctrl_link->down_complete);
+
+			info.error = rtn;
+			rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+							 SL_LGRP_NOTIF_LINK_ERROR, &info, core_link_up_info.info_map);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+						       "up callback work ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+
+			return info.error;
+		}
+		return 0;
+
+	default:
+		sl_ctrl_link_up_clock_reset(ctrl_link);
+		sl_ctrl_link_state_stopping_set(ctrl_link);
+
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"up callback work invalid (core_state = %u, core_imap = %s)",
+			core_link_up_info.state, core_imap_str);
+
+		flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+
+		complete_all(&ctrl_link->down_complete);
+
+		info.error = -EBADRQC;
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+						 SL_LGRP_NOTIF_LINK_ERROR, &info, core_link_up_info.info_map);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "up callback work ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+
+		return info.error;
+	}
+}
+
+int sl_ctrl_link_fault_start_callback(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) = NULL;
+
+	ctrl_link = sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
+	if (!ctrl_link)
+		return -ENODEV;
+	if (!ctrl_link) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"NULL link (ldev_num = %u, lgrp_num = %u, link_num = %u)",
+			ldev_num, lgrp_num, link_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+				"fault start callback kref unavailable (ctrl_link = 0x%p)", ctrl_link);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "fault start callback");
+
+	sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_STOPPING);
+
+	sl_ctrl_link_fec_mon_stop(ctrl_link);
+	cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+
+	if (sl_ctrl_link_put(ctrl_link))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"fault start callback - link removed (link = 0x%p)", ctrl_link);
+
+	return 0;
+}
+
+int sl_ctrl_link_fault_callback(void *tag, u32 core_state, u64 core_cause_map, u64 core_info_map)
+{
+	struct sl_ctrl_link      *ctrl_link;
+	char                      core_imap_str[SL_LINK_INFO_STRLEN];
+	int                       rtn;
+	union sl_lgrp_notif_info  info;
+
+	ctrl_link = tag;
+
+	SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_FAULT_ASYNC);
+
+	sl_core_info_map_str(core_info_map, core_imap_str, sizeof(core_imap_str));
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"fault callback (core_state = %u %s, core_cause_map = 0x%llX, core_info_map = %s (0x%llx))",
+			core_state, sl_core_link_state_str(core_state), core_cause_map, core_imap_str, core_info_map);
+
+	sl_ctrl_link_up_clock_reset(ctrl_link);
+
+	switch (core_state) {
+	case SL_CORE_LINK_STATE_DOWN:
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN);
+
+		sl_ctrl_link_fec_mon_stop(ctrl_link);
+		cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+
+		flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+		complete_all(&ctrl_link->down_complete);
+
+		rtn = sl_ctrl_async_link_down_notif_send(ctrl_link, core_cause_map, core_info_map);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "fault callback async_link_down_notif_send failed [%d]", rtn);
+
+		return 0;
+
+	default:
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"fault callback invalid (core_state = %u)", core_state);
+
+		flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+
+		complete_all(&ctrl_link->down_complete);
+
+		info.error = -EBADRQC;
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+						 SL_LGRP_NOTIF_LINK_ERROR, &info, core_info_map);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "fault callback ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+
+		return 0;
+	}
+}
+
+int sl_ctrl_link_an_lp_caps_get_callback(void *tag, struct sl_link_caps *caps, u32 result)
+{
+	int                       rtn;
+	struct sl_ctrl_link      *ctrl_link;
+	union sl_lgrp_notif_info  info;
+
+	ctrl_link          =  tag;
+	info.lp_link_caps = *caps;
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "an lp caps get callback");
+
+	switch (result) {
+	case SL_CORE_LINK_LP_CAPS_DATA:
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+						 SL_LGRP_NOTIF_AN_DATA, &info, 0);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "lp caps data ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		break;
+	case SL_CORE_LINK_LP_CAPS_TIMEOUT:
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+						 SL_LGRP_NOTIF_AN_TIMEOUT, NULL, 0);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "lp caps timeout ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		break;
+	case SL_CORE_LINK_LP_CAPS_ERROR:
+	default:
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_link->ctrl_lgrp, ctrl_link->num,
+						 SL_LGRP_NOTIF_AN_ERROR, NULL, 0);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "lp caps error ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		break;
+	}
+
+	return 0;
+}
+
+int sl_ctrl_link_down_callback(void *tag, u32 core_state, u64 core_cause_map, u64 core_info_map)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	char                 cause_str[100];
+
+	ctrl_link = tag;
+
+	sl_link_down_cause_map_with_info_str(core_cause_map, cause_str, sizeof(cause_str));
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"down callback (core_state = %u %s, core_cause = 0x%llX %s, core_info_map = %llu)",
+		core_state, sl_core_link_state_str(core_state), core_cause_map, cause_str, core_info_map);
+
+	switch (core_state) {
+	case SL_CORE_LINK_STATE_DOWN:
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN);
+
+		if (core_cause_map & SL_LINK_DOWN_CAUSE_CANCELED)
+			SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_CANCELED);
+
+		sl_ctrl_link_fec_mon_stop(ctrl_link);
+		cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+
+		flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+		complete_all(&ctrl_link->down_complete);
+
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+				"down callback (down_complete = 0x%p)", &ctrl_link->down_complete);
+
+		rtn = sl_ctrl_link_down_notif_send(ctrl_link, core_cause_map, core_info_map);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "down callback ctrl_link_down_notif_send failed [%d]", rtn);
+		return 0;
+	default:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down callback invalid (core_state = %u %s)",
+				core_state, sl_core_link_state_str(core_state));
+		return -EBADRQC;
+	}
+}
+
+static int sl_ctrl_link_async_down_callback(void *tag, u32 core_state, u64 core_cause_map, u64 core_info_map)
+{
+	int                  rtn;
+	struct sl_ctrl_link *ctrl_link;
+	char                 cause_str[100];
+
+	ctrl_link = tag;
+
+	sl_link_down_cause_map_with_info_str(core_cause_map, cause_str, sizeof(cause_str));
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"async down callback (core_state = %u %s, core_cause = 0x%llX %s, core_info_map = %llu)",
+		core_state, sl_core_link_state_str(core_state), core_cause_map, cause_str, core_info_map);
+
+	switch (core_state) {
+	case SL_CORE_LINK_STATE_DOWN:
+		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN);
+
+		sl_ctrl_link_fec_mon_stop(ctrl_link);
+		cancel_work_sync(&ctrl_link->fec_mon_timer_work);
+
+		flush_work(&ctrl_link->ctrl_lgrp->notif_work);
+		sl_ctrl_link_state_set(ctrl_link, SL_LINK_STATE_DOWN);
+		complete_all(&ctrl_link->down_complete);
+
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+				"async down callback (down_complete = 0x%p)", &ctrl_link->down_complete);
+
+		rtn = sl_ctrl_async_link_down_notif_send(ctrl_link, core_cause_map, core_info_map);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+					       "async down callback async_link_down_notif_send failed [%d]", rtn);
+
+		sl_ctrl_link_put(ctrl_link);
+		return 0;
+	default:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "async down callback invalid (core_state = %u %s)",
+				core_state, sl_core_link_state_str(core_state));
+
+		sl_ctrl_link_put(ctrl_link);
+		return -EBADRQC;
+	}
+}
+
+int sl_ctrl_link_async_down(struct sl_ctrl_link *ctrl_link, u64 down_cause_map, bool force_down)
+{
+	int  rtn;
+	u32  link_state;
+	u32  policy_options;
+	bool accepted;
+	char cause_str[SL_LINK_DOWN_CAUSE_STR_SIZE];
+
+	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
+		sl_ctrl_log_err(ctrl_link, LOG_NAME,
+				"async_down kref_get_unless_zero failed (ctrl_link = 0x%p)", ctrl_link);
+		return -EBADRQC;
+	}
+
+	sl_link_down_cause_map_with_info_str(down_cause_map, cause_str, sizeof(cause_str));
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"async_down (down_cause_map = 0x%llX %s)", down_cause_map, cause_str);
+
+	sl_ctrl_link_up_clock_reset(ctrl_link);
+
+	policy_options = sl_ctrl_link_policy_options_get(ctrl_link);
+
+	spin_lock(&ctrl_link->data_lock);
+	link_state = ctrl_link->state;
+	switch (link_state) {
+	case SL_LINK_STATE_UP_DOWN_REQ:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "async_down already requested");
+		spin_unlock(&ctrl_link->data_lock);
+		sl_ctrl_link_put(ctrl_link);
+		return 0;
+	case SL_LINK_STATE_UP:
+		if (!force_down && (policy_options & SL_LINK_POLICY_OPT_LINK_DOWN_REQ)) {
+			ctrl_link->state = SL_LINK_STATE_UP_DOWN_REQ;
+			sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "async_down request link down");
+			spin_unlock(&ctrl_link->data_lock);
+			rtn = sl_ctrl_link_down_req_notif_send(ctrl_link, down_cause_map, 0);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME,
+						       "async_down ctrl_link_down_req_notif_send failed [%d]",
+						       rtn);
+			sl_ctrl_link_put(ctrl_link);
+			return 0;
+		}
+		ctrl_link->state = SL_LINK_STATE_STOPPING;
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "async_down stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		kref_get(&ctrl_link->ref_cnt);
+		rtn = sl_core_link_down_request(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
+						ctrl_link->ctrl_lgrp->num, ctrl_link->num,
+						sl_ctrl_link_async_down_callback, ctrl_link,
+						down_cause_map, &accepted);
+		if (!accepted)
+			sl_ctrl_link_put(ctrl_link);
+		if (rtn) {
+			sl_ctrl_log_err(ctrl_link, LOG_NAME, "async_down core_link_down failed [%d]", rtn);
+			spin_lock(&ctrl_link->data_lock);
+			if (ctrl_link->state == SL_LINK_STATE_STOPPING)
+				ctrl_link->state = SL_LINK_STATE_UP;
+			spin_unlock(&ctrl_link->data_lock);
+			sl_ctrl_link_put(ctrl_link);
+			return rtn;
+		}
+		sl_ctrl_link_put(ctrl_link);
+		return 0;
+	case SL_LINK_STATE_DOWN:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "async_down already down");
+		spin_unlock(&ctrl_link->data_lock);
+		sl_ctrl_link_put(ctrl_link);
+		return 0;
+	case SL_LINK_STATE_STOPPING:
+		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "async_down already stopping");
+		spin_unlock(&ctrl_link->data_lock);
+		sl_ctrl_link_put(ctrl_link);
+		return 0;
+	default:
+		sl_ctrl_log_err(ctrl_link, LOG_NAME, "async_down invalid state (link_state = %u %s)",
+				link_state, sl_link_state_str(link_state));
+		spin_unlock(&ctrl_link->data_lock);
+		sl_ctrl_link_put(ctrl_link);
+		return -EBADRQC;
+	}
+}
+
+void sl_ctrl_link_config_get(struct sl_ctrl_link *ctrl_link, struct sl_link_config *link_config)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*link_config = ctrl_link->config;
+	spin_unlock(&ctrl_link->config_lock);
+}
+
+void sl_ctrl_link_policy_get(struct sl_ctrl_link *ctrl_link, struct sl_link_policy *link_policy)
+{
+	spin_lock(&ctrl_link->config_lock);
+	*link_policy = ctrl_link->policy;
+	spin_unlock(&ctrl_link->config_lock);
+}
+
+s32 sl_ctrl_link_policy_fec_mon_ucw_down_limit_get(struct sl_ctrl_link *ctrl_link)
+{
+	s32 fec_mon_ucw_down_limit;
+
+	spin_lock(&ctrl_link->config_lock);
+	fec_mon_ucw_down_limit = ctrl_link->policy.fec_mon_ucw_down_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	return fec_mon_ucw_down_limit;
+}
+
+s32 sl_ctrl_link_policy_fec_mon_ucw_warn_limit_get(struct sl_ctrl_link *ctrl_link)
+{
+	s32 fec_mon_ucw_warn_limit;
+
+	spin_lock(&ctrl_link->config_lock);
+	fec_mon_ucw_warn_limit = ctrl_link->policy.fec_mon_ucw_warn_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	return fec_mon_ucw_warn_limit;
+}
+
+s32 sl_ctrl_link_policy_fec_mon_ccw_down_limit_get(struct sl_ctrl_link *ctrl_link)
+{
+	s32 fec_mon_ccw_down_limit;
+
+	spin_lock(&ctrl_link->config_lock);
+	fec_mon_ccw_down_limit = ctrl_link->policy.fec_mon_ccw_down_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	return fec_mon_ccw_down_limit;
+}
+
+s32 sl_ctrl_link_policy_fec_mon_ccw_warn_limit_get(struct sl_ctrl_link *ctrl_link)
+{
+	s32 fec_mon_ccw_warn_limit;
+
+	spin_lock(&ctrl_link->config_lock);
+	fec_mon_ccw_warn_limit = ctrl_link->policy.fec_mon_ccw_warn_limit;
+	spin_unlock(&ctrl_link->config_lock);
+
+	return fec_mon_ccw_warn_limit;
+}
+
+s32 sl_ctrl_link_policy_fec_mon_period_ms_get(struct sl_ctrl_link *ctrl_link)
+{
+	s32 fec_mon_period_ms;
+
+	spin_lock(&ctrl_link->config_lock);
+	fec_mon_period_ms = ctrl_link->policy.fec_mon_period_ms;
+	spin_unlock(&ctrl_link->config_lock);
+
+	return fec_mon_period_ms;
+}
+
+u32 sl_ctrl_link_policy_options_get(struct sl_ctrl_link *ctrl_link)
+{
+	u32 options;
+
+	spin_lock(&ctrl_link->config_lock);
+	options = ctrl_link->policy.options;
+	spin_unlock(&ctrl_link->config_lock);
+
+	return options;
+}
+
+void sl_ctrl_link_state_set(struct sl_ctrl_link *ctrl_link, u32 link_state)
+{
+	spin_lock(&ctrl_link->data_lock);
+	ctrl_link->state = link_state;
+	spin_unlock(&ctrl_link->data_lock);
+}
+
+u32 sl_ctrl_link_state_get(struct sl_ctrl_link *ctrl_link)
+{
+	u32 state;
+
+	spin_lock(&ctrl_link->data_lock);
+	state = ctrl_link->state;
+	spin_unlock(&ctrl_link->data_lock);
+
+	return state;
+}
+
+int sl_ctrl_link_last_up_fail_cause_map_get(struct sl_ctrl_link *ctrl_link, u64 *last_up_fail_cause_map)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*last_up_fail_cause_map = ctrl_link->last_up_fail_cause_map;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"last_up_fail_cause_map_get (last_up_fail_cause_map = 0x%llX)", *last_up_fail_cause_map);
+
+	return 0;
+}
+
+int sl_ctrl_link_last_up_fail_cause_info_get(struct sl_ctrl_link *ctrl_link, u64 *last_up_fail_cause_map,
+					     time64_t *last_up_fail_time)
+{
+	spin_lock(&ctrl_link->data_lock);
+	*last_up_fail_cause_map = ctrl_link->last_up_fail_cause_map;
+	*last_up_fail_time = ctrl_link->last_up_fail_time;
+	spin_unlock(&ctrl_link->data_lock);
+
+	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
+			"last up fail time show (cause_map = 0x%llX, time = %lld %ptTt %ptTd)",
+			*last_up_fail_cause_map, *last_up_fail_time, last_up_fail_time, last_up_fail_time);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c
new file mode 100644
index 000000000000..016ea353da4f
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c
@@ -0,0 +1,630 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/types.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+#include "sl_asic.h"
+#include "sl_sysfs.h"
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_lgrp_notif.h"
+#include "sl_ctrl_llr.h"
+#include "data/sl_core_data_llr.h"
+#include "sl_core_str.h"
+#include "sl_ctrl_llr_counters.h"
+
+#define LOG_NAME SL_CTRL_LLR_LOG_NAME
+
+#define SL_CTRL_LLR_DEL_WAIT_TIMEOUT_MS 2000
+
+static struct sl_ctrl_llr *ctrl_llrs[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+static DEFINE_SPINLOCK(ctrl_llrs_lock);
+
+static void sl_ctrl_llr_setup_callback(void *tag,
+				       enum sl_core_llr_state core_llr_state,
+				       u64 core_imap,
+				       struct sl_llr_data core_llr_data)
+{
+	int rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	union sl_lgrp_notif_info info;
+
+	ctrl_llr = tag;
+
+	ctrl_llr->setup.state = core_llr_state;
+	ctrl_llr->setup.imap  = core_imap;
+	ctrl_llr->setup.data  = core_llr_data;
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "setup callback (state = %u %s)", core_llr_state,
+			sl_core_llr_state_str(core_llr_state));
+
+	switch (core_llr_state) {
+	case SL_CORE_LLR_STATE_SETUP:
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_SETUP);
+		info.llr_data = ctrl_llr->setup.data;
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
+						 SL_LGRP_NOTIF_LLR_SETUP, &info, ctrl_llr->setup.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "setup SETUP ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		return;
+	case SL_CORE_LLR_STATE_SETUP_TIMEOUT:
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_SETUP_TIMEOUT);
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
+						 SL_LGRP_NOTIF_LLR_SETUP_TIMEOUT, NULL, ctrl_llr->setup.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "setup TIMEOUT ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		return;
+	case SL_CORE_LLR_STATE_CONFIGURED:
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_CONFIGURED);
+		memset(&ctrl_llr->setup.data, 0, sizeof(struct sl_llr_data));
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
+						 SL_LGRP_NOTIF_LLR_CANCELED, NULL, ctrl_llr->setup.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "setup CONFIGURED ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		return;
+	default:
+		memset(&ctrl_llr->setup.data, 0, sizeof(struct sl_llr_data));
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME,
+				"setup ERROR invalid (state = %u %s)",
+				core_llr_state, sl_core_llr_state_str(core_llr_state));
+		info.error = -ENOMSG;
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
+						 SL_LGRP_NOTIF_LLR_ERROR, &info, ctrl_llr->setup.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "setup ERROR ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+		return;
+	}
+}
+
+static void sl_ctrl_llr_start_callback(void *tag,
+				       enum sl_core_llr_state core_llr_state,
+				       u64 core_imap)
+{
+	int rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	union sl_lgrp_notif_info info;
+
+	ctrl_llr = tag;
+
+	ctrl_llr->start.state = core_llr_state;
+	ctrl_llr->start.imap  = core_imap;
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "start callback (state = %u %s)",
+			core_llr_state, sl_core_llr_state_str(core_llr_state));
+
+	switch (core_llr_state) {
+	case SL_CORE_LLR_STATE_RUNNING:
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_RUNNING);
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
+						 SL_LGRP_NOTIF_LLR_RUNNING, NULL, ctrl_llr->start.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "start RUNNING ctrl_lgrp_notif_enqueue failed [%d[", rtn);
+		return;
+	case SL_CORE_LLR_STATE_START_TIMEOUT:
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_START_TIMEOUT);
+		if (ctrl_llr->policy.options & SL_LLR_POLICY_OPT_CONTINUOUS_START_TRIES) {
+			sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "start TIMEOUT retry");
+			rtn = sl_core_llr_start(ctrl_llr->ctrl_lgrp->ctrl_ldev->num, ctrl_llr->ctrl_lgrp->num,
+						ctrl_llr->num, sl_ctrl_llr_start_callback, ctrl_llr, 0);
+			if (rtn)
+				sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+						       "start TIMEOUT core_llr_start retry failed [%d]", rtn);
+		}
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
+						 SL_LGRP_NOTIF_LLR_START_TIMEOUT, NULL, ctrl_llr->start.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "start TIMEOUT ctrl_lgrp_notif_enqueue failed [%d[", rtn);
+		return;
+	case SL_CORE_LLR_STATE_SETUP:
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_SETUP);
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
+						 SL_LGRP_NOTIF_LLR_CANCELED, NULL, ctrl_llr->start.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "start CONFIGURED ctrl_lgrp_notif_enqueue failed [%d[", rtn);
+		return;
+	default:
+		memset(&ctrl_llr->setup.data, 0, sizeof(struct sl_llr_data));
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME, "start ERROR invalid (state = %u %s)",
+				core_llr_state, sl_core_llr_state_str(core_llr_state));
+		info.error = -ENOMSG;
+		rtn = sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num, SL_LGRP_NOTIF_LLR_ERROR,
+						 &info, ctrl_llr->setup.imap);
+		if (rtn)
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME, "start ERROR ctrl_lgrp_notif_enqueue failed [%d[",
+					       rtn);
+		return;
+	}
+}
+
+int sl_ctrl_llr_new(u8 ldev_num, u8 lgrp_num, u8 llr_num, struct kobject *sysfs_parent)
+{
+	int                 rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "exists (ctrl_llr = 0x%p)", ctrl_llr);
+		return -EBADRQC;
+	}
+
+	ctrl_llr = kzalloc(sizeof(*ctrl_llr), GFP_KERNEL);
+	if (!ctrl_llr)
+		return -ENOMEM;
+
+	ctrl_llr->magic     = SL_CTRL_LLR_MAGIC;
+	ctrl_llr->ver       = SL_CTRL_LLR_VER;
+	ctrl_llr->num       = llr_num;
+	ctrl_llr->ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_llr->ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"new NULL lgrp (ldev_num = %u, lgrp_num = %u)", ldev_num, lgrp_num);
+		kfree(ctrl_llr);
+		return -EBADRQC;
+	}
+
+	spin_lock_init(&ctrl_llr->data_lock);
+	kref_init(&ctrl_llr->ref_cnt);
+	init_completion(&ctrl_llr->del_complete);
+
+	rtn = sl_ctrl_llr_counters_init(ctrl_llr);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME, "ctrl_llr_counters_init failed [%d]", rtn);
+		goto out;
+	}
+
+	rtn = sl_ctrl_llr_cause_counters_init(ctrl_llr);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME, "ctrl_llr_cause_counters_init failed [%d]", rtn);
+		goto out_counters;
+	}
+
+	rtn = sl_core_llr_new(ldev_num, lgrp_num, llr_num);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME, "core_llr_new failed [%d]", rtn);
+		goto out_cause_counters;
+	}
+
+	if (sysfs_parent) {
+		ctrl_llr->parent_kobj = sysfs_parent;
+
+		rtn = sl_sysfs_llr_create(ctrl_llr);
+		if (rtn) {
+			sl_ctrl_log_err(ctrl_llr, LOG_NAME, "sysfs_llr_create failed [%d]", rtn);
+			goto out_llr_new;
+		}
+	}
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "new (ctrl_llr = 0x%p)", ctrl_llr);
+
+	spin_lock(&ctrl_llrs_lock);
+	ctrl_llrs[ldev_num][lgrp_num][llr_num] = ctrl_llr;
+	spin_unlock(&ctrl_llrs_lock);
+
+	return 0;
+out_llr_new:
+		sl_core_llr_del(ldev_num, lgrp_num, llr_num);
+out_cause_counters:
+	sl_ctrl_llr_cause_counters_del(ctrl_llr);
+out_counters:
+	sl_ctrl_llr_counters_del(ctrl_llr);
+out:
+	kfree(ctrl_llr);
+	return rtn;
+}
+
+static void sl_ctrl_llr_release(struct kref *kref)
+{
+	int                 rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	u8                  ldev_num;
+	u8                  lgrp_num;
+	u8                  llr_num;
+
+	ctrl_llr = container_of(kref, struct sl_ctrl_llr, ref_cnt);
+	ldev_num = ctrl_llr->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = ctrl_llr->ctrl_lgrp->num;
+	llr_num = ctrl_llr->num;
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "release (ctrl_llr = 0x%p)", ctrl_llr);
+
+	rtn = sl_core_llr_stop(ldev_num, lgrp_num, llr_num);
+	if (rtn)
+		sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME, "release core_llr_stop failed [%d]", rtn);
+
+	/* Must delete sysfs first to guarantee nobody is reading */
+	sl_sysfs_llr_delete(ctrl_llr);
+
+	sl_core_llr_del(ldev_num, lgrp_num, llr_num);
+
+	/* Free the counters and unpublish together so cause_counter_inc() sees neither half-done */
+	spin_lock(&ctrl_llrs_lock);
+	sl_ctrl_llr_counters_del(ctrl_llr);
+	sl_ctrl_llr_cause_counters_del(ctrl_llr);
+	ctrl_llrs[ldev_num][lgrp_num][llr_num] = NULL;
+	spin_unlock(&ctrl_llrs_lock);
+
+	complete_all(&ctrl_llr->del_complete);
+
+	kfree(ctrl_llr);
+}
+
+static int sl_ctrl_llr_put(struct sl_ctrl_llr *ctrl_llr)
+{
+	return kref_put(&ctrl_llr->ref_cnt, sl_ctrl_llr_release);
+}
+
+int sl_ctrl_llr_del(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	unsigned long       timeleft;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err_trace(NULL, LOG_NAME,
+				      "del not found (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				      ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	/* Release occurs on the last caller. Block until complete. */
+	if (!sl_ctrl_llr_put(ctrl_llr)) {
+		timeleft = wait_for_completion_timeout(&ctrl_llr->del_complete,
+						       msecs_to_jiffies(SL_CTRL_LLR_DEL_WAIT_TIMEOUT_MS));
+
+		if (timeleft == 0) {
+			sl_ctrl_log_err(NULL, LOG_NAME,
+					"del completion_timeout (ctrl_llr = 0x%p)", ctrl_llr);
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
+static bool sl_ctrl_llr_kref_get_unless_zero(struct sl_ctrl_llr *ctrl_llr)
+{
+	return (kref_get_unless_zero(&ctrl_llr->ref_cnt) != 0);
+}
+
+struct sl_ctrl_llr *sl_ctrl_llr_get(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+
+	spin_lock(&ctrl_llrs_lock);
+	ctrl_llr = ctrl_llrs[ldev_num][lgrp_num][llr_num];
+	spin_unlock(&ctrl_llrs_lock);
+
+	sl_ctrl_log_dbg(NULL, LOG_NAME,
+			"get (ldev_num = %u, lgrp_num = %u, llr_num = %u, ctrl_llr = 0x%p)",
+			ldev_num, lgrp_num, llr_num, ctrl_llr);
+
+	return ctrl_llr;
+}
+
+/*
+ * The lookup and the counter update are done under ctrl_llrs_lock, which
+ * sl_ctrl_llr_release() also holds while it frees the counters.
+ */
+void sl_ctrl_llr_cause_counter_inc(struct sl_core_llr *core_llr, unsigned long cause_map)
+{
+	struct sl_ctrl_llr *ctrl_llr;
+	u8                  ldev_num = core_llr->core_lgrp->core_ldev->num;
+	u8                  lgrp_num = core_llr->core_lgrp->num;
+
+	spin_lock(&ctrl_llrs_lock);
+	ctrl_llr = ctrl_llrs[ldev_num][lgrp_num][core_llr->num];
+	if (ctrl_llr)
+		sl_ctrl_llr_cause_counters_inc(ctrl_llr, cause_map);
+	spin_unlock(&ctrl_llrs_lock);
+
+	if (!ctrl_llr)
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "llr cause counter inc - llr not found");
+}
+
+int sl_ctrl_llr_config_set(u8 ldev_num, u8 lgrp_num, u8 llr_num, struct sl_llr_config *llr_config)
+{
+	int                rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"config set NULL llr (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_llr_kref_get_unless_zero(ctrl_llr)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"config set kref_get_unless_zero failed (ctrl_llr = 0x%p)",
+				ctrl_llr);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "config set (setup timeout = %d, start timeout = %d)",
+			llr_config->setup_timeout_ms, llr_config->start_timeout_ms);
+
+	rtn = sl_core_llr_config_set(ldev_num, lgrp_num, llr_num, llr_config);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME, "core_llr_config_set failed [%d]", rtn);
+		goto out;
+	}
+
+	spin_lock(&ctrl_llr->data_lock);
+	ctrl_llr->config = *llr_config;
+	spin_unlock(&ctrl_llr->data_lock);
+
+out:
+	if (sl_ctrl_llr_put(ctrl_llr))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"config set - llr removed (ctrl_llr = 0x%p)", ctrl_llr);
+
+	return rtn;
+}
+
+int sl_ctrl_llr_policy_set(u8 ldev_num, u8 lgrp_num, u8 llr_num, struct sl_llr_policy *llr_policy)
+{
+	int                rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"policy set NULL llr (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_llr_kref_get_unless_zero(ctrl_llr)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"policy set kref_get_unless_zero failed (ctrl_llr = 0x%p)", ctrl_llr);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "policy set");
+
+	rtn = sl_core_llr_policy_set(ldev_num, lgrp_num, llr_num, llr_policy);
+	if (rtn) {
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME, "core_llr_policy_set failed [%d]", rtn);
+		goto out;
+	}
+
+	spin_lock(&ctrl_llr->data_lock);
+	ctrl_llr->policy = *llr_policy;
+	spin_unlock(&ctrl_llr->data_lock);
+
+out:
+	if (sl_ctrl_llr_put(ctrl_llr))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"policy set - llr removed (ctrl_llr = 0x%p)", ctrl_llr);
+
+	return rtn;
+}
+
+int sl_ctrl_llr_setup(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	int                rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"setup NULL llr (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_llr_kref_get_unless_zero(ctrl_llr)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"setup kref_get_unless_zero failed (ctrl_llr = 0x%p)", ctrl_llr);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "setup");
+
+	SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_SETUP_CMD);
+
+	rtn = sl_core_llr_setup(ldev_num, lgrp_num, llr_num,
+				sl_ctrl_llr_setup_callback, ctrl_llr, 0);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_llr, LOG_NAME, "core_llr_setup failed [%d]", rtn);
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_SETUP_FAIL);
+	}
+
+	if (sl_ctrl_llr_put(ctrl_llr))
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "setup - llr removed (ctrl_llr = 0x%p)", ctrl_llr);
+
+	return rtn;
+}
+
+int sl_ctrl_llr_start(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	int                rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"start NULL llr (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_llr_kref_get_unless_zero(ctrl_llr)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"start kref_get_unless_zero failed (ctrl_llr = 0x%p)", ctrl_llr);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "start");
+
+	SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_START_CMD);
+
+	rtn = sl_core_llr_start(ldev_num, lgrp_num, llr_num,
+				sl_ctrl_llr_start_callback, ctrl_llr, 0);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_llr, LOG_NAME, "core_llr_start failed [%d]", rtn);
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_START_FAIL);
+	}
+
+	if (sl_ctrl_llr_put(ctrl_llr))
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "start - llr removed (ctrl_llr = 0x%p)", ctrl_llr);
+
+	return rtn;
+}
+
+int sl_ctrl_llr_stop(u8 ldev_num, u8 lgrp_num, u8 llr_num)
+{
+	int                rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"stop NULL llr (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_llr_kref_get_unless_zero(ctrl_llr)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"stop kref_get_unless_zero failed (ctrl_llr = 0x%p)", ctrl_llr);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "stop");
+
+	SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_STOP_CMD);
+
+	rtn = sl_core_llr_stop(ldev_num, lgrp_num, llr_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_llr, LOG_NAME, "core_llr_stop failed [%d]", rtn);
+		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_STOP_FAIL);
+	}
+
+	if (sl_ctrl_llr_put(ctrl_llr))
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "stop - llr removed (ctrl_llr = 0x%p)", ctrl_llr);
+
+	return rtn;
+}
+
+enum sl_llr_state sl_ctrl_llr_state_from_core_llr_state(enum sl_core_llr_state core_llr_state)
+{
+	switch (core_llr_state) {
+	case SL_CORE_LLR_STATE_NEW:
+		return SL_LLR_STATE_OFF;
+	case SL_CORE_LLR_STATE_CONFIGURED:
+	case SL_CORE_LLR_STATE_SETUP_TIMEOUT:
+	case SL_CORE_LLR_STATE_SETUP_STOPPING:
+		return SL_LLR_STATE_CONFIGURED;
+	case SL_CORE_LLR_STATE_SETTING_UP:
+		return SL_LLR_STATE_SETUP_BUSY;
+	case SL_CORE_LLR_STATE_SETUP:
+	case SL_CORE_LLR_STATE_START_TIMEOUT:
+		return SL_LLR_STATE_SETUP;
+	case SL_CORE_LLR_STATE_STARTING:
+		return SL_LLR_STATE_START_BUSY;
+	case SL_CORE_LLR_STATE_RUNNING:
+		return SL_LLR_STATE_RUNNING;
+	case SL_CORE_LLR_STATE_STOPPING:
+		return SL_LLR_STATE_STOP_BUSY;
+	case SL_CORE_LLR_STATE_SETUP_CANCELING:
+	case SL_CORE_LLR_STATE_START_CANCELING:
+		return SL_LLR_STATE_CANCELING;
+	case SL_CORE_LLR_STATE_INVALID:
+	default:
+		return SL_LLR_STATE_INVALID;
+	}
+}
+
+int sl_ctrl_llr_state_get(u8 ldev_num, u8 lgrp_num, u8 llr_num, enum sl_llr_state *state)
+{
+	int rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+	enum sl_core_llr_state core_llr_state;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"state get NULL llr (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_llr_kref_get_unless_zero(ctrl_llr)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"state get kref_get_unless_zero failed (ctrl_llr = 0x%p)",
+				ctrl_llr);
+		return -EBADRQC;
+	}
+
+	rtn = sl_core_llr_state_get(ldev_num, lgrp_num, llr_num, &core_llr_state);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_llr, LOG_NAME, "core_llr_state_get failed [%d]", rtn);
+		*state = SL_LLR_STATE_OFF;
+		rtn = 0;
+		goto out;
+	}
+
+	*state = sl_ctrl_llr_state_from_core_llr_state(core_llr_state);
+	if (*state == SL_LLR_STATE_INVALID)
+		sl_ctrl_log_err(ctrl_llr, LOG_NAME,
+				"invalid (core_llr_state = %u %s)",
+				core_llr_state, sl_core_llr_state_str(core_llr_state));
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "state (core = %u %s, ctrl = %u %s)",
+			core_llr_state, sl_core_llr_state_str(core_llr_state),
+			*state, sl_llr_state_str(*state));
+
+out:
+	if (sl_ctrl_llr_put(ctrl_llr))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"state get - llr removed (ctrl_llr = 0x%p)", ctrl_llr);
+
+	return rtn;
+}
+
+int sl_ctrl_llr_info_map_get(u8 ldev_num, u8 lgrp_num, u8 llr_num, u64 *info_map)
+{
+	int                 rtn;
+	struct sl_ctrl_llr *ctrl_llr;
+
+	ctrl_llr = sl_ctrl_llr_get(ldev_num, lgrp_num, llr_num);
+	if (!ctrl_llr) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"info map get NULL llr (ldev_num = %u, lgrp_num = %u, llr_num = %u)",
+				ldev_num, lgrp_num, llr_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_llr_kref_get_unless_zero(ctrl_llr)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"info map get kref_get_unless_zero failed (ctrl_llr = 0x%p)", ctrl_llr);
+		return -EBADRQC;
+	}
+
+	rtn = sl_core_data_llr_info_map_get(sl_core_llr_get(ldev_num, lgrp_num, llr_num), info_map);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_llr, LOG_NAME, "core_data_llr_info_map_get failed [%d]", rtn);
+		goto out;
+	}
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "info map get (info_map = 0x%llX)", *info_map);
+
+out:
+	if (sl_ctrl_llr_put(ctrl_llr))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"info map get - llr removed (ctrl_llr = 0x%p)", ctrl_llr);
+
+	return rtn;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr_counters.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr_counters.c
new file mode 100644
index 000000000000..81af580d3837
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr_counters.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+#include <linux/atomic.h>
+#include <linux/types.h>
+
+#include "sl_ctrl_llr.h"
+#include "sl_ctrl_llr_counters.h"
+#include "base/sl_ctrl_log.h"
+
+#define LOG_NAME SL_CTRL_LLR_LOG_NAME
+
+#define SL_CTRL_LLR_COUNTER_INIT(_llr, _counter) \
+	(_llr)->counters[_counter].name = #_counter
+
+#define SL_CTRL_LLR_CAUSE_COUNTER_INIT(_llr, _counter) \
+	(_llr)->cause_counters[_counter].name = #_counter
+
+#define SL_CTRL_LLR_CAUSE_COUNTER_INC(_llr, _counter) \
+	atomic_inc(&(_llr)->cause_counters[_counter].count)
+
+int sl_ctrl_llr_counters_init(struct sl_ctrl_llr *ctrl_llr)
+{
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "llr counters init");
+
+	ctrl_llr->counters = kzalloc(sizeof(*ctrl_llr->counters) * SL_CTRL_LLR_COUNTERS_COUNT, GFP_KERNEL);
+	if (!ctrl_llr->counters)
+		return -ENOMEM;
+
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_SETUP_CMD);
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_SETUP);
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_SETUP_TIMEOUT);
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_SETUP_FAIL);
+
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_CONFIGURED);
+
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_START_CMD);
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_RUNNING);
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_START_TIMEOUT);
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_START_FAIL);
+
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_STOP_CMD);
+	SL_CTRL_LLR_COUNTER_INIT(ctrl_llr, LLR_STOP_FAIL);
+
+	return 0;
+}
+
+int sl_ctrl_llr_cause_counters_init(struct sl_ctrl_llr *ctrl_llr)
+{
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "llr cause counters init");
+
+	ctrl_llr->cause_counters = kzalloc(sizeof(*ctrl_llr->cause_counters) *
+					   SL_CTRL_LLR_CAUSE_COUNTERS_COUNT, GFP_KERNEL);
+	if (!ctrl_llr->cause_counters)
+		return -ENOMEM;
+
+	SL_CTRL_LLR_CAUSE_COUNTER_INIT(ctrl_llr, LLR_CAUSE_SETUP_CONFIG);
+	SL_CTRL_LLR_CAUSE_COUNTER_INIT(ctrl_llr, LLR_CAUSE_SETUP_INTR_ENABLE);
+	SL_CTRL_LLR_CAUSE_COUNTER_INIT(ctrl_llr, LLR_CAUSE_SETUP_TIMEOUT);
+	SL_CTRL_LLR_CAUSE_COUNTER_INIT(ctrl_llr, LLR_CAUSE_START_INTR_ENABLE);
+	SL_CTRL_LLR_CAUSE_COUNTER_INIT(ctrl_llr, LLR_CAUSE_START_TIMEOUT);
+	SL_CTRL_LLR_CAUSE_COUNTER_INIT(ctrl_llr, LLR_CAUSE_COMMAND);
+	SL_CTRL_LLR_CAUSE_COUNTER_INIT(ctrl_llr, LLR_CAUSE_CANCELED);
+
+	return 0;
+}
+
+int sl_ctrl_llr_counter_get(struct sl_ctrl_llr *ctrl_llr, u32 counter, int *count)
+{
+	*count = atomic_read(&ctrl_llr->counters[counter].count);
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "get (counter = %u %s, count = %d)", counter,
+			ctrl_llr->counters[counter].name, *count);
+
+	return 0;
+}
+
+int sl_ctrl_llr_cause_counter_get(struct sl_ctrl_llr *ctrl_llr, u32 counter, int *count)
+{
+	*count = atomic_read(&ctrl_llr->cause_counters[counter].count);
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "get (cause counter = %u %s, count = %d)", counter,
+			ctrl_llr->cause_counters[counter].name, *count);
+
+	return 0;
+}
+
+void sl_ctrl_llr_counters_del(struct sl_ctrl_llr *ctrl_llr)
+{
+	kfree(ctrl_llr->counters);
+}
+
+void sl_ctrl_llr_cause_counters_del(struct sl_ctrl_llr *ctrl_llr)
+{
+	kfree(ctrl_llr->cause_counters);
+}
+
+void sl_ctrl_llr_cause_counters_inc(struct sl_ctrl_llr *ctrl_llr, unsigned long cause_map)
+{
+	unsigned long which;
+
+	sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "llr cause counter inc");
+
+	BUILD_BUG_ON(SL_CTRL_LLR_CAUSE_COUNTERS_COUNT > 32);
+
+	for_each_set_bit(which, &cause_map, sizeof(cause_map) * BITS_PER_BYTE) {
+		switch (BIT(which)) {
+		case SL_LLR_FAIL_CAUSE_SETUP_CONFIG:
+			SL_CTRL_LLR_CAUSE_COUNTER_INC(ctrl_llr, LLR_CAUSE_SETUP_CONFIG);
+			break;
+		case SL_LLR_FAIL_CAUSE_SETUP_INTR_ENABLE:
+			SL_CTRL_LLR_CAUSE_COUNTER_INC(ctrl_llr, LLR_CAUSE_SETUP_INTR_ENABLE);
+			break;
+		case SL_LLR_FAIL_CAUSE_SETUP_TIMEOUT:
+			SL_CTRL_LLR_CAUSE_COUNTER_INC(ctrl_llr, LLR_CAUSE_SETUP_TIMEOUT);
+			break;
+		case SL_LLR_FAIL_CAUSE_START_INTR_ENABLE:
+			SL_CTRL_LLR_CAUSE_COUNTER_INC(ctrl_llr, LLR_CAUSE_START_INTR_ENABLE);
+			break;
+		case SL_LLR_FAIL_CAUSE_START_TIMEOUT:
+			SL_CTRL_LLR_CAUSE_COUNTER_INC(ctrl_llr, LLR_CAUSE_START_TIMEOUT);
+			break;
+		case SL_LLR_FAIL_CAUSE_COMMAND:
+			SL_CTRL_LLR_CAUSE_COUNTER_INC(ctrl_llr, LLR_CAUSE_COMMAND);
+			break;
+		case SL_LLR_FAIL_CAUSE_CANCELED:
+			SL_CTRL_LLR_CAUSE_COUNTER_INC(ctrl_llr, LLR_CAUSE_CANCELED);
+			break;
+		default:
+			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
+					       "cause_counter_inc unknown cause (bit = %lu)", which);
+			break;
+		}
+	}
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c
new file mode 100644
index 000000000000..a4202757d238
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kobject.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+
+#include <linux/hpe/sl/sl_mac.h>
+
+#include "sl_asic.h"
+#include "sl_sysfs.h"
+#include "base/sl_ctrl_log.h"
+#include "sl_ctrl_ldev.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_ctrl_mac.h"
+#include "sl_core_mac.h"
+#include "sl_ctrl_mac_counters.h"
+
+#define SL_CTRL_MAC_DEL_WAIT_TIMEOUT_MS 2000
+
+#define LOG_NAME SL_CTRL_MAC_LOG_NAME
+
+static struct sl_ctrl_mac *ctrl_macs[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS][SL_ASIC_MAX_LINKS];
+static DEFINE_SPINLOCK(ctrl_macs_lock);
+
+int sl_ctrl_mac_new(u8 ldev_num, u8 lgrp_num, u8 mac_num, struct kobject *sysfs_parent)
+{
+	int                 rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (ctrl_mac) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "exists (mac = 0x%p)", ctrl_mac);
+		return -EBADRQC;
+	}
+
+	ctrl_mac = kzalloc(sizeof(*ctrl_mac), GFP_KERNEL);
+	if (!ctrl_mac)
+		return -ENOMEM;
+
+	ctrl_mac->magic     = SL_CTRL_MAC_MAGIC;
+	ctrl_mac->ver       = SL_CTRL_MAC_VER;
+	ctrl_mac->num       = mac_num;
+	ctrl_mac->ctrl_lgrp = sl_ctrl_lgrp_get(ldev_num, lgrp_num);
+	if (!ctrl_mac->ctrl_lgrp) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"new NULL lgrp (ldev_num = %u, lgrp_num = %u)", ldev_num, lgrp_num);
+		kfree(ctrl_mac);
+		return -EBADRQC;
+	}
+
+	kref_init(&ctrl_mac->ref_cnt);
+	kref_init(&ctrl_mac->mem_ref);
+	init_completion(&ctrl_mac->del_complete);
+
+	spin_lock_init(&ctrl_mac->data_lock);
+
+	rtn = sl_ctrl_mac_counters_init(ctrl_mac);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "ctrl_mac_counters_init failed [%d]", rtn);
+		goto out;
+	}
+
+	rtn = sl_core_mac_new(ldev_num, lgrp_num, mac_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "core_mac_new failed [%d]", rtn);
+		goto out_counters;
+	}
+
+	if (sysfs_parent) {
+		ctrl_mac->parent_kobj = sysfs_parent;
+
+		rtn = sl_sysfs_mac_create(ctrl_mac);
+		if (rtn) {
+			sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "sysfs_mac_create failed [%d]", rtn);
+			goto out_mac_new;
+		}
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "new (mac = 0x%p)", ctrl_mac);
+
+	spin_lock(&ctrl_macs_lock);
+	ctrl_macs[ldev_num][lgrp_num][mac_num] = ctrl_mac;
+	spin_unlock(&ctrl_macs_lock);
+
+	return 0;
+
+out_mac_new:
+	sl_core_mac_del(ldev_num, lgrp_num, mac_num);
+out_counters:
+	sl_ctrl_mac_counters_del(ctrl_mac);
+out:
+	kfree(ctrl_mac);
+	return rtn;
+}
+
+static void sl_ctrl_mac_free(struct kref *kref)
+{
+	kfree(container_of(kref, struct sl_ctrl_mac, mem_ref));
+}
+
+static void sl_ctrl_mac_release(struct kref *kref)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	u8                  ldev_num;
+	u8                  lgrp_num;
+	u8                  mac_num;
+
+	ctrl_mac = container_of(kref, struct sl_ctrl_mac, ref_cnt);
+	ldev_num = ctrl_mac->ctrl_lgrp->ctrl_ldev->num;
+	lgrp_num = ctrl_mac->ctrl_lgrp->num;
+	mac_num  = ctrl_mac->num;
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "release (ctrl_mac = 0x%p)", ctrl_mac);
+
+	/* Must delete sysfs first to guarantee nobody is reading */
+	sl_sysfs_mac_delete(ctrl_mac);
+
+	sl_core_mac_del(ldev_num, lgrp_num, mac_num);
+
+	sl_ctrl_mac_counters_del(ctrl_mac);
+
+	spin_lock(&ctrl_macs_lock);
+	ctrl_macs[ldev_num][lgrp_num][mac_num] = NULL;
+	spin_unlock(&ctrl_macs_lock);
+
+	/*
+	 * Wake a waiting sl_ctrl_mac_del(). The memory is not freed here:
+	 * the waiter still uses del_complete and ctrl_mac after it wakes,
+	 * and holds mem_ref until it is done. The last holder frees it.
+	 */
+	complete_all(&ctrl_mac->del_complete);
+	kref_put(&ctrl_mac->mem_ref, sl_ctrl_mac_free);
+}
+
+static int sl_ctrl_mac_put(struct sl_ctrl_mac *ctrl_mac)
+{
+	return kref_put(&ctrl_mac->ref_cnt, sl_ctrl_mac_release);
+}
+
+int sl_ctrl_mac_del(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+	unsigned long       timeleft;
+	int                 rtn = 0;
+
+	sl_ctrl_log_dbg(NULL, LOG_NAME, "del (ldev_num = %u, lgrp_num = %u, mac_num = %u)",
+			ldev_num, lgrp_num, mac_num);
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_err_trace(NULL, LOG_NAME,
+				      "mac not found (ldev_num = %u, lgrp_num = %u, mac_num = %u)",
+				      ldev_num, lgrp_num, mac_num);
+		return -EBADRQC;
+	}
+
+	/*
+	 * Keep the memory, and with it del_complete, valid until we are done
+	 * waiting: the release may run on another thread and must not free it
+	 * under us.
+	 */
+	kref_get(&ctrl_mac->mem_ref);
+
+	/* Release occurs on the last caller. Block until complete. */
+	if (!sl_ctrl_mac_put(ctrl_mac)) {
+		timeleft = wait_for_completion_timeout(&ctrl_mac->del_complete,
+						       msecs_to_jiffies(SL_CTRL_MAC_DEL_WAIT_TIMEOUT_MS));
+
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"del completion_timeout (timeleft = %lums)", timeleft);
+
+		if (timeleft == 0) {
+			sl_ctrl_log_err(NULL, LOG_NAME,
+					"del completion_timeout (ctrl_mac = 0x%p)", ctrl_mac);
+			rtn = -ETIMEDOUT;
+		}
+	}
+
+	kref_put(&ctrl_mac->mem_ref, sl_ctrl_mac_free);
+
+	return rtn;
+}
+
+static bool sl_ctrl_mac_kref_get_unless_zero(struct sl_ctrl_mac *ctrl_mac)
+{
+	return (kref_get_unless_zero(&ctrl_mac->ref_cnt) != 0);
+}
+
+struct sl_ctrl_mac *sl_ctrl_mac_get(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+
+	spin_lock(&ctrl_macs_lock);
+	ctrl_mac = ctrl_macs[ldev_num][lgrp_num][mac_num];
+	spin_unlock(&ctrl_macs_lock);
+
+	sl_ctrl_log_dbg(NULL, LOG_NAME,
+			"get (ldev_num = %u, lgrp_num = %u, mac_num = %u, mac = 0x%p)",
+			ldev_num, lgrp_num, mac_num, ctrl_mac);
+
+	return ctrl_mac;
+}
+
+int sl_ctrl_mac_tx_start(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	int                rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "tx start - NULL mac");
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"tx start - kref unavailable (ctrl_mac = 0x%p)", ctrl_mac);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "tx start");
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_TX_START_CMD);
+
+	rtn = sl_core_mac_tx_start(ldev_num, lgrp_num, mac_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "tx start - core_mac_tx_start failed [%d]", rtn);
+		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_TX_START_FAIL);
+		goto out;
+	}
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_TX_STARTED);
+
+	rtn = 0;
+
+out:
+	if (sl_ctrl_mac_put(ctrl_mac))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"tx start - mac removed (ctrl_mac = 0x%p)", ctrl_mac);
+
+	return rtn;
+}
+
+int sl_ctrl_mac_tx_stop(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	int                rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "tx stop - NULL mac");
+		return 0;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"tx stop - kref unavailable (ctrl_mac = 0x%p)", ctrl_mac);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "tx stop");
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_TX_STOP_CMD);
+
+	rtn = sl_core_mac_tx_stop(ldev_num, lgrp_num, mac_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "tx stop - core_mac_tx_stop failed [%d]", rtn);
+		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_TX_STOP_FAIL);
+		goto out;
+	}
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_TX_STOPPED);
+
+	rtn = 0;
+
+out:
+	if (sl_ctrl_mac_put(ctrl_mac))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"tx stop - mac removed (ctrl_mac = 0x%p)", ctrl_mac);
+
+	return rtn;
+}
+
+int sl_ctrl_mac_tx_state_get(u8 ldev_num, u8 lgrp_num, u8 mac_num, u32 *state)
+{
+	int                rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                core_mac_state;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "tx state get - NULL mac");
+		*state = SL_MAC_STATE_OFF;
+		return 0;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"tx state get - kref unavailable (ctrl_mac = 0x%p)", ctrl_mac);
+		*state = SL_MAC_STATE_OFF;
+		return 0;
+	}
+
+	rtn = sl_core_mac_tx_state_get(ldev_num, lgrp_num, mac_num, &core_mac_state);
+	if (rtn) {
+		sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "tx state get - core_mac_tx_state_get failed [%d]", rtn);
+		*state = SL_MAC_STATE_OFF;
+		goto out;
+	}
+
+	switch (core_mac_state) {
+	case SL_CORE_MAC_STATE_ON:
+		*state = SL_MAC_STATE_ON;
+		break;
+	default:
+		*state = SL_MAC_STATE_OFF;
+		break;
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "tx state get (state = %u %s, core_state = %u)",
+			*state, sl_mac_state_str(*state), core_mac_state);
+
+out:
+	if (sl_ctrl_mac_put(ctrl_mac))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"tx state get - mac removed (ctrl_mac = 0x%p)", ctrl_mac);
+
+	return 0;
+}
+
+int sl_ctrl_mac_rx_start(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	int                rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_err(NULL, LOG_NAME, "rx start - NULL mac");
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"rx start - kref unavailable (ctrl_mac = 0x%p)", ctrl_mac);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "rx start");
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RX_START_CMD);
+
+	rtn = sl_core_mac_rx_start(ldev_num, lgrp_num, mac_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "rx start - core_mac_rx_start failed [%d]", rtn);
+		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RX_START_FAIL);
+		goto out;
+	}
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RX_STARTED);
+
+	rtn = 0;
+
+out:
+
+	if (sl_ctrl_mac_put(ctrl_mac))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"rx start - mac removed (ctrl_mac = 0x%p)", ctrl_mac);
+
+	return rtn;
+}
+
+int sl_ctrl_mac_rx_stop(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	int                rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "rx stop - NULL mac");
+		return 0;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"rx stop - kref unavailable (ctrl_mac = 0x%p)", ctrl_mac);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "rx stop");
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RX_STOP_CMD);
+
+	rtn = sl_core_mac_rx_stop(ldev_num, lgrp_num, mac_num);
+	if (rtn) {
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "rx stop - core_mac_rx_stop failed [%d]", rtn);
+		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RX_STOP_FAIL);
+		goto out;
+	}
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RX_STOPPED);
+
+	rtn = 0;
+
+out:
+
+	sl_ctrl_mac_put(ctrl_mac);
+
+	return rtn;
+}
+
+int sl_ctrl_mac_rx_state_get(u8 ldev_num, u8 lgrp_num, u8 mac_num, u32 *state)
+{
+	int                rtn;
+	struct sl_ctrl_mac *ctrl_mac;
+	u32                core_mac_state;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "rx state get - NULL mac");
+		*state = SL_MAC_STATE_OFF;
+		return 0;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"rx state get - kref unavailable (ctrl_mac = 0x%p)", ctrl_mac);
+		*state = SL_MAC_STATE_OFF;
+		return 0;
+	}
+
+	rtn = sl_core_mac_rx_state_get(ldev_num, lgrp_num, mac_num, &core_mac_state);
+	if (rtn) {
+		sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "rx state get - core_mac_rx_state_get failed [%d]", rtn);
+		*state = SL_MAC_STATE_OFF;
+		goto out;
+	}
+
+	switch (core_mac_state) {
+	case SL_CORE_MAC_STATE_ON:
+		*state = SL_MAC_STATE_ON;
+		break;
+	default:
+		*state = SL_MAC_STATE_OFF;
+		break;
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "rx state get (state = %u %s, core_state = %u)",
+			*state, sl_mac_state_str(*state), core_mac_state);
+
+out:
+
+	if (sl_ctrl_mac_put(ctrl_mac))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"rx state get - mac removed (ctrl_mac = 0x%p)", ctrl_mac);
+
+	return 0;
+}
+
+int sl_ctrl_mac_reset(u8 ldev_num, u8 lgrp_num, u8 mac_num)
+{
+	int                tx_rtn;
+	int                rx_rtn;
+	int                rtn = 0;
+	struct sl_ctrl_mac *ctrl_mac;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_dbg(NULL, LOG_NAME, "reset - NULL mac");
+		return 0;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"reset - kref unavailable (ctrl_mac = 0x%p)", ctrl_mac);
+		return -EBADRQC;
+	}
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "reset");
+
+	SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RESET_CMD);
+
+	tx_rtn = sl_core_mac_tx_stop(ldev_num, lgrp_num, mac_num);
+	if (tx_rtn) {
+		/* Log error, but allow the function to continue to mac rx stop */
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "reset - core_mac_tx_stop failed [%d]", tx_rtn);
+	}
+
+	rx_rtn = sl_core_mac_rx_stop(ldev_num, lgrp_num, mac_num);
+	if (rx_rtn) {
+		/* Log error, but allow the function to continue execution */
+		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "core_mac_rx_stop failed [%d]", rx_rtn);
+	}
+
+	if (tx_rtn && rx_rtn) {
+		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RESET_FAIL);
+		rtn = -EIO;
+	} else {
+		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RESET);
+	}
+
+	sl_ctrl_mac_put(ctrl_mac);
+
+	return rtn;
+}
+
+int sl_ctrl_mac_info_map_get(u8 ldev_num, u8 lgrp_num, u8 mac_num, u64 *info_map)
+{
+	struct sl_ctrl_mac *ctrl_mac;
+
+	ctrl_mac = sl_ctrl_mac_get(ldev_num, lgrp_num, mac_num);
+	if (!ctrl_mac) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"info map get NULL mac (ldev_num = %u, lgrp_num = %u, mac_num = %u)",
+				ldev_num, lgrp_num, mac_num);
+		return -EBADRQC;
+	}
+
+	if (!sl_ctrl_mac_kref_get_unless_zero(ctrl_mac)) {
+		sl_ctrl_log_err(NULL, LOG_NAME,
+				"info map get kref_get_unless_zero failed (ctrl_mac = 0x%p)",
+				ctrl_mac);
+		return -EBADRQC;
+	}
+
+	*info_map = sl_core_mac_info_map_get(ldev_num, lgrp_num, mac_num);
+
+	sl_ctrl_log_dbg(ctrl_mac, LOG_NAME, "info map get (info_map = 0x%llX)", *info_map);
+
+	if (sl_ctrl_mac_put(ctrl_mac))
+		sl_ctrl_log_dbg(NULL, LOG_NAME,
+				"info map get - mac removed (ctrl_mac = 0x%p)", ctrl_mac);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac_counters.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac_counters.c
new file mode 100644
index 000000000000..a30e64f80122
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac_counters.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+#include <linux/atomic.h>
+#include <linux/types.h>
+
+#include "sl_ctrl_mac.h"
+#include "sl_ctrl_mac_counters.h"
+
+#define SL_CTRL_MAC_COUNTER_INIT(_mac, _counter) \
+	(_mac)->counters[_counter].name = #_counter
+
+int sl_ctrl_mac_counters_init(struct sl_ctrl_mac *ctrl_mac)
+{
+	if (ctrl_mac->counters)
+		return -EALREADY;
+
+	ctrl_mac->counters = kzalloc(sizeof(*ctrl_mac->counters) * SL_CTRL_MAC_COUNTERS_COUNT, GFP_KERNEL);
+	if (!ctrl_mac->counters)
+		return -ENOMEM;
+
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_TX_START_CMD);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_TX_STARTED);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_TX_START_FAIL);
+
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_TX_STOP_CMD);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_TX_STOPPED);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_TX_STOP_FAIL);
+
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RX_START_CMD);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RX_STARTED);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RX_START_FAIL);
+
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RX_STOP_CMD);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RX_STOPPED);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RX_STOP_FAIL);
+
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RESET_CMD);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RESET);
+	SL_CTRL_MAC_COUNTER_INIT(ctrl_mac, MAC_RESET_FAIL);
+
+	return 0;
+}
+
+int sl_ctrl_mac_counter_get(struct sl_ctrl_mac *ctrl_mac, u32 counter, int *count)
+{
+	*count = atomic_read(&ctrl_mac->counters[counter].count);
+
+	return 0;
+}
+
+void sl_ctrl_mac_counters_del(struct sl_ctrl_mac *ctrl_mac)
+{
+	kfree(ctrl_mac->counters);
+}
diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_media_counters.c b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_media_counters.c
new file mode 100644
index 000000000000..0f12a479d017
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_media_counters.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025,2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+#include <linux/atomic.h>
+#include <linux/types.h>
+
+#include "sl_media_jack.h"
+#include "sl_ctrl_media_counters.h"
+#include "base/sl_ctrl_log.h"
+
+#define LOG_NAME SL_CTRL_MEDIA_LOG_NAME
+
+#define SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(_media, _counter) \
+	(_media)->cause_counters[_counter].name = #_counter
+
+int sl_ctrl_media_cause_counters_init(struct sl_media_jack *media_jack)
+{
+	sl_ctrl_log_dbg(media_jack, LOG_NAME, "media cause counters init");
+
+	media_jack->cause_counters = kzalloc(sizeof(*media_jack->cause_counters) *
+					     SL_CTRL_MEDIA_CAUSE_COUNTERS_COUNT, GFP_KERNEL);
+	if (!media_jack->cause_counters)
+		return -ENOMEM;
+
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_EEPROM_FORMAT_UNSUPPORTED);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_EEPROM_VENDOR_UNSUPPORTED);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_EEPROM_JACK_IO);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_ONLINE_STATUS_GET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_ONLINE_TIMEDOUT);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_ONLINE_JACK_IO);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_ONLINE_JACK_GET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SERDES_SETTINGS_GET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SCAN_STATUS_GET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SCAN_HDL_GET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SCAN_JACK_GET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_MEDIA_ATTR_SET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_INTR_EVENT_JACK_IO);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_POWER_SET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO_LOW_POWER_SET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO_HIGH_POWER_SET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO_LOW_POWER_SET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO_HIGH_POWER_SET);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_SHIFT_STATE_JACK_IO);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_OFFLINE);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_HOT);
+	SL_CTRL_MEDIA_CAUSE_COUNTER_INIT(media_jack, MEDIA_CAUSE_WARM);
+
+	return 0;
+}
+
+int sl_ctrl_media_cause_counter_get(struct sl_media_jack *media_jack, u32 counter, int *count)
+{
+	*count = atomic_read(&media_jack->cause_counters[counter].count);
+
+	sl_ctrl_log_dbg(media_jack, LOG_NAME, "get (cause counter = %u %s, count = %d)", counter,
+			media_jack->cause_counters[counter].name, *count);
+
+	return 0;
+}
+
+void sl_ctrl_media_cause_counters_del(struct sl_media_jack *media_jack)
+{
+	kfree(media_jack->cause_counters);
+}
+
+void sl_ctrl_media_cause_counter_inc(struct sl_media_jack *media_jack, unsigned long cause_map)
+{
+	unsigned long which;
+
+	sl_ctrl_log_dbg(media_jack, LOG_NAME, "media cause counter inc");
+
+	BUILD_BUG_ON(SL_CTRL_MEDIA_CAUSE_COUNTERS_COUNT > 32);
+
+	for_each_set_bit(which, &cause_map, sizeof(cause_map) * BITS_PER_BYTE) {
+		switch (BIT(which)) {
+		case SL_MEDIA_FAULT_CAUSE_EEPROM_FORMAT_UNSUPPORTED:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_EEPROM_FORMAT_UNSUPPORTED);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_EEPROM_VENDOR_UNSUPPORTED:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_EEPROM_VENDOR_UNSUPPORTED);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_EEPROM_JACK_IO:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_EEPROM_JACK_IO);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_ONLINE_STATUS_GET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_ONLINE_STATUS_GET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_ONLINE_TIMEDOUT:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_ONLINE_TIMEDOUT);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_ONLINE_JACK_IO:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_ONLINE_JACK_IO);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_ONLINE_JACK_GET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_ONLINE_JACK_GET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SERDES_SETTINGS_GET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SERDES_SETTINGS_GET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SCAN_STATUS_GET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SCAN_STATUS_GET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SCAN_HDL_GET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SCAN_HDL_GET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SCAN_JACK_GET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SCAN_JACK_GET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_MEDIA_ATTR_SET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_MEDIA_ATTR_SET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_INTR_EVENT_JACK_IO:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_INTR_EVENT_JACK_IO);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_POWER_SET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_POWER_SET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO_LOW_POWER_SET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO_LOW_POWER_SET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO_HIGH_POWER_SET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SHIFT_DOWN_JACK_IO_HIGH_POWER_SET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO_LOW_POWER_SET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO_LOW_POWER_SET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO_HIGH_POWER_SET:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SHIFT_UP_JACK_IO_HIGH_POWER_SET);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_SHIFT_STATE_JACK_IO:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_SHIFT_STATE_JACK_IO);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_OFFLINE:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_OFFLINE);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_HOT:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_HOT);
+			break;
+		case SL_MEDIA_FAULT_CAUSE_WARM:
+			SL_CTRL_MEDIA_CAUSE_COUNTER_INC(media_jack, MEDIA_CAUSE_WARM);
+			break;
+		default:
+			sl_ctrl_log_warn_trace(media_jack, LOG_NAME,
+					       "cause_counter_inc unknown fault cause (bit = %lu)", which);
+			break;
+		}
+	}
+}

-- 
2.56.0

