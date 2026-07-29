Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020112.outbound.protection.outlook.com [52.101.193.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5303B3C1F
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Jul 2026 22:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785364353; cv=fail; b=mLMmBLJrQlB7dQy5yFdQh4bdoVnhfdKAFG2wapaBcrOWhK9C8MrO/kuma8HavA03MQhbRWNGxOmFx+zAZCZXOUkbeMuCj8QyjUe5rf185FMlwgTn0lCjHj3+zM6jXal1FLWAVQsvmVjKs59K5OKYZ2SiHyDG6KvpnW4RzLwNJxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785364353; c=relaxed/simple;
	bh=vUXsx82W4JkHJlNCrBlM2ioF2OIifjt4ZnEauyhWFbY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIfKtqmMjbJ3frW5XMZdsQgqRJRnlXQZh9wrUKVDQ1BkBoZ6pIbjl2do3zeVYUn/YuEjaUeIOwYieMJQacGcZRvb4rLQe0OLq1q+qyrRO53Tajo6ja74VwA18MaR55EtSA50cI3FVXUQ0prbj1Yv7HvMuG3gInY0cW65IPClgmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com; spf=pass smtp.mailfrom=selinc.com; dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b=lY0VvHv3; arc=fail smtp.client-ip=52.101.193.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=selinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b="lY0VvHv3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+fAIdKkWp991FqZ+EHXc2SUQH+EN+64Ny/K+HoXfgAHCjq7bCHYEJ/a5id6rnNkdmwBDgDBjHACjCeVfhJBMG9xc2Wy+tMWiZA5dChdULvXnkiM2DOWaX9Wnlhs8rkfS6tm9os3Rb51QvME2xcM5xKoOu9ueylYYZ/4EyecQ6sF6h/H/g5S9UymPBuV9XDD/ObglA2Rgx8XKQxrHFk6Po9fGPlhh/lRT6Zp/NcFPEOr7NiBmlUEayLMoRRh5ArRRJvjIbr8fRIWk7Ke/7/RYrKQ2SYJdp2swuTqer9FxNYNCpjtrHsnQvtkDrNv+Zv0FkzyxGi3xZrsoJQ9BEaAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUXsx82W4JkHJlNCrBlM2ioF2OIifjt4ZnEauyhWFbY=;
 b=nZ5DGpJVVJGVo8QW71q8hn/m/PVRTjIa2ZVq214n4ZKv2bnDDuUe8W8+mtrs1Pf3mXWw3j6kApAWBupgUGraqOLUCyOhwZfvfWEkzk67ZYsUQx7sqvvDZr9T/eKDUS69niD69b4NOQP8u9Aeko1oXU+ySMYdSoE1UDWE7qtoXWvaMgZwccHtfBNDPRAEdpht0wn98BGW4bULmbw8R///hZR/1PEPIIZ2s1j6gzM3g8QyLqxejO6S795LU441PfeLs9Az/pD7UtJf3qEFpHM9CpQ2NoZVW+yNq+zygVNiRvhz80rNwftrG/yEWOO65HrR1ujjV8S+lILqACRWnS9YWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 74.117.212.83) smtp.rcpttodomain=fritz.com smtp.mailfrom=selinc.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=selinc.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUXsx82W4JkHJlNCrBlM2ioF2OIifjt4ZnEauyhWFbY=;
 b=lY0VvHv3Y/dmOAXhfWaFM8bkYvf6PCx4sTC/HkvIxpCkNtxaoZ45EXeRiogIL/LfNDFlEshlBmWDwzkpO+Iao4vEddx4rf9s0s3mw0bLsa4nUoXFfwDRr2UVEejjyskJKLP7ZvM+WXFODyV+y9uHp/LPCRTOL/nV7QRaThTSIRwwkfQWVglr1dHeMHM8znG+lit8SK8BL6HfRRAezhPRmbl+PAwWJxB4Wb8iBpMa4ccpgP7O4tnov29vDdwo2eApaWJjkSMw5ZOhy2dE5dNQ8pqerDtjktsC/Q/kSv4tWfRpQe4TA4JQ9+0KcNAQQNTUnvw2iCKs/U+nlRHUrw6liw==
Received: from SN7PR04CA0180.namprd04.prod.outlook.com (2603:10b6:806:125::35)
 by SJ0PR22MB2845.namprd22.prod.outlook.com (2603:10b6:a03:3d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 22:32:24 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::25) by SN7PR04CA0180.outlook.office365.com
 (2603:10b6:806:125::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 22:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 74.117.212.83)
 smtp.mailfrom=selinc.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=selinc.com;
Received-SPF: Pass (protection.outlook.com: domain of selinc.com designates
 74.117.212.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=74.117.212.83; helo=email.selinc.com; pr=C
Received: from email.selinc.com (74.117.212.83) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:32:23 +0000
Received: from LOGAFINLPC.ad.selinc.com (10.100.90.200) by
 wpul-exchange.ad.selinc.com (10.53.14.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:32:22 -0700
From: logafinl <logan_finley@selinc.com>
To: <n.schier@fritz.com>
CC: <linux-kbuild@vger.kernel.org>, <nathan@kernel.org>, <nsc@kernel.org>,
	<rashinkar.anish@gmail.com>, <thomas.weissschuh@linutronix.de>
Subject: Re: Re: MO flag not working properly for building out-of-tree modules, tries to replace the Makefile in the kernel's source.
Date: Wed, 29 Jul 2026 15:32:22 -0700
Message-ID: <20260729223222.6922-1-logan_finley@selinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722-conscious-petrel-of-acumen-cdac27@l-nschier-aarch64>
References: <20260722-conscious-petrel-of-acumen-cdac27@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|SJ0PR22MB2845:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dee3658-9849-4fe8-4595-08deedc1427e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003|43062017;
X-Microsoft-Antispam-Message-Info:
	II+aB/1IfMMlF1oUcH6dXuymKzESiPJipiykZIi4atZgua7O+BrNuWQ4B+dGLNPRuWu1ZsbT1qhHHRFboEYHY2bhUVJzeosHik/QCgXRMx4kkhEaS4wrktMFqtfk9Ipa5ltE7arDNWUZUKCJYIhJlcN1wEeCCRJ47yDO0o9TTG/SusXXZIQA7dn0ctLa6+FbOwm7wG6uMSGMdmfDW1vF3QycC42he1gYZESgYJJQ8huh0QWlN2/t+XMC68WgptRp17XsRdxnvHZYjQngN+6jdD9euFHLRABc99gz2z4Dua6gH+u1Pwd36ODuFgE84nwWZMzccYL1BAIUAzdUYNuua28FYU6YOCU4jtX1u5E2Tuq/OPEnOBa5GoME6neWYI/5THXTJn2hf8bsM83s8gEGNpemgVu8udtooAHbu/dbwSAb5guu4uDcWHZhrpiMFVohTAYOAHkKOO1T9i4s7fmzaXv13zK7VRirQQbH2yGavlw3I4jWNE+00rwGnVRCqF/qKZGujeLarHXoHpKbR2ESXdoget6kyE6JEaDuQLyVUwFIYqgNLBhl0FikRsttDU1ZJqxwUVBgfRbc+pGM6mxmNcEHuTT67kHi+kIED2+HZ089q/ef0yBD8tISXglHO6lkFAUHEN6i1oh5eo1izB4PnRRB1W2KBeoPm/Rwdp+JXoiaCGQG+LyG80EayVE4R9K5la+wMw3sMhuVuPBEOX/N1mku4JEb/gBeDza6H2CDfKMWHGYDNyJffWajpEWvQKJH
X-Forefront-Antispam-Report:
	CIP:74.117.212.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:email.selinc.com;PTR:wpul-exchange1.selinc.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(43062017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3398PzcRtzzvrDs539DLp6PSXn2oMy2RT0eFWKAPzNqDsGWaEMv49CZQ0vveXspjjX3TKm0oBQHWS07291Ij3zd9Krkcqa4fY4Coabflj5E936sevWi+8vLsT/Y+fbnvHKlMZStn1OBHSDFKRN2m5OwGpBOx2xTZ4N8P6xwl2Zg+4TYytxnpwe0r28AhzMPQuzRXi2v8IXGxCne2sGAIX64TyaTKj/E6U7NPuG3nZj1pXb7qJdJ9qFKYTCFfQ/WRUo2cA+YRAjjeT6QTNobVaeOFEJvfv5M6RRvL8GI9CgwjJxRmCjxma/y0zX7WEp+rFzXliHe0+e+LMTCFQlXnSfLAPy+wC/GAM3eodNQItLoz7mC8mEhf5YWpTRhnEdAyb48C7hhO5VJPtRTAWMUzKtOQYxUMQPqfRDVbOHAj6hWeMYLzpP4FSFBWGGdhNjoT
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:32:23.0998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dee3658-9849-4fe8-4595-08deedc1427e
X-MS-Exchange-CrossTenant-Id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=12381f30-10fe-4e2c-aa3a-5e03ebeb59ec;Ip=[74.117.212.83];Helo=[email.selinc.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB2845

Hello,

I was running into this issue myself and used bisect to pinpoint
c9bb03ac2c66bc5aa81b51ea0792477524c2763a as the commit that introduced the bug.
I don't have enough experience in Kbuild to understand what in that commit
causing the problem, unfortunately.

Thanks,
Logan Finley
