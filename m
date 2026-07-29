Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021109.outbound.protection.outlook.com [40.93.194.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1263806DC
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Jul 2026 23:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785368208; cv=fail; b=kBK0PZav6P1SaNpqBlQmbm0PBpQQi+BBYdkyYbFm1ulr4wRel3Rxgb3KuVWMACejtT0KrHLuFwcnkXCsLMNRQN6b8V3wZF2BJg3hz49ABkYJlDveNWgBQ4cVySsUuEOfoV8pzdArebznS14ifAZSVhCARdd8iFFthmeQR4aEe94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785368208; c=relaxed/simple;
	bh=NCwZKs2O/a3oHH57BYvGxBBmewcnmpNXuZUCSvY4Dok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4k4FxMrgkOyYZgeFZgwnQPWn+EH2n7Xs8jnrlmibRbPT0dFw8oLoho47WyjpfP4xfAMdvsUqGD3fGyN2tLLIs0zKwme8hmmXizwv975A85Kz/oTkjWXhbHS93m7m0thdr30lRHSPT1cBWoUNwTzVZ+08C0FOZMyzYgWlT9unSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com; spf=pass smtp.mailfrom=selinc.com; dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b=fYMBLQl+; arc=fail smtp.client-ip=40.93.194.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=selinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b="fYMBLQl+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao9/Q6QyTH4i62f6+n+AqdcVJTlNY37LJwEHHPNgyL4IG4kSuHbVo6QTx1ItUzoM2Obn7IoJQVOq0jrx0J1FSaD0K9e8X2zGYohnfK3T1A+oyxseAPGpxGxT3z11uHQM3+vl73K4uHv7ArBAo2stfbmHtyYAUzTSY6m9YR7CKmISDIRvb+u7dqZBk+5wnBTWtwBcUPQtNcNJux+XepdhVIY9vwXWLJl9gqKQ0dJFJ05g7t2RJvUzdZ9hFn1uDvtCGF4RHcYgcFIrdeRwNQ+Yd9nBuHivIaqiHG5akzlvnlIc7BPu3cC9lgYztZZuz2/A7KQU8Tp6UVt1/2ggSjugFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3EJfk0viDqxwfwvLjzxrLyCNjbncdt94M3640fAOhk=;
 b=umDPQNrono0SdwxayIyRPjZ/363RmYf3UlnwCsapv8pGEpJScEQYWEvx1EPciC8gpQ8ba6/jw7iMSlbXsH0O82FEOKY7O20mO7axLLSiBUOdXpIMeQJFW+5l9Ebq/VzYxDZdd6BlNLcn1yldvO0TSaYMCtCBqt97xKh/aGdByfKZQs1pgMvYyjEMPGBdLI+VXIr+F54IloOTtWjT2BI4rQw7YKxW5/9XsVAeR/0xWJnjoxHog2ZvE/tvfyLaUzuopRdjwlyQDla2NYcBFA8EhqZf3ABMActhxroQDdJIze+Jt+lM9UUwzGT1X0kQb4nYDdARK4nLgJwmCB1q1LIl8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 74.117.212.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=selinc.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=selinc.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3EJfk0viDqxwfwvLjzxrLyCNjbncdt94M3640fAOhk=;
 b=fYMBLQl+SmGnw8fVASMit/omd6CYYfp4qtVHTIn22nYjO6ioWH4deRmz11KmJhha4r0Y9omXF9zx12vuUOM9WGRmoqkDHMDdHLu9wLaq7d1sZd/QGgMofeyNkJP2I1hq8TwUVo81RFCO1Gu23A1wWuNhqPLgbBZNz5yLWJB8/emN2wPZ1Ygdh4GDTixyvQxqLomPWCCSFIaF/rM2dyhmByWCV5Wz5tmFDFMuISaoOeqy5dobe0ZHJIxKlXzGwcQ4Ko7+SGT5DvcB8imghqMNJS6a3i+JKIzQNX+RqPmvhAlQdNdpeyD6BD3NNqaElEOn6BNlXroz7Djm/DnKBPtP5Q==
Received: from SJ0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:a03:33b::33)
 by BL1PPF6D267B6B8.namprd22.prod.outlook.com (2603:10b6:20f:fc04::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:36:43 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::25) by SJ0PR05CA0028.outlook.office365.com
 (2603:10b6:a03:33b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.7 via Frontend Transport; Wed, 29
 Jul 2026 23:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 74.117.212.83)
 smtp.mailfrom=selinc.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=selinc.com;
Received-SPF: Pass (protection.outlook.com: domain of selinc.com designates
 74.117.212.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=74.117.212.83; helo=email.selinc.com; pr=C
Received: from email.selinc.com (74.117.212.83) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 23:36:42 +0000
Received: from LOGAFINLPC.ad.selinc.com (10.100.90.200) by
 wpul-exchange.ad.selinc.com (10.53.14.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 16:36:41 -0700
From: Logan Finley <logan_finley@selinc.com>
To: <nathan@kernel.org>
CC: <linux-kbuild@vger.kernel.org>, <n.schier@fritz.com>, <nsc@kernel.org>,
	<rashinkar.anish@gmail.com>, <thomas.weissschuh@linutronix.de>
Subject: Re: Re: MO flag not working properly for building out-of-tree modules, tries to replace the Makefile in the kernel's source.
Date: Wed, 29 Jul 2026 16:36:41 -0700
Message-ID: <20260729233641.189148-1-logan_finley@selinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729231242.GB1120279@ax162>
References: <20260729231242.GB1120279@ax162>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|BL1PPF6D267B6B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 503009a8-24a1-49e2-2712-08deedca3e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|30052699003|82310400026|1800799024|13003099007|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3O6gOKBe49FdkSKiXIejBmmwn+/b57NlZZJwa3Pm/3Ut7+up6V79HgD0IPdZ5TilFJGHXOV7jAZzL7rc/VAcr1dsRT3zMohTv2l9UUA60pI+sZWm91JaXArOVi4UysD4apPsBYAqQK5pfmmYPyjnvYsifobnilgfDDqdBzpkqKHzeH6SjXrOcJacEFp1GntBKXq7xQgkI/cWTchN4bel5lHxNfoF1QnI5aWJQPEvHPk+NsSve+m8/MVULNc41lscCw5TpbPrLafS7Rm48+X1TpkS745EfJljRFhZQkPt414tap7OfCXGyTWHnlIAoaWZbjvSFhGE0mZoqgRD16D0tRzlW5rmPc9Mh+r7mm5nvFKLO9tGGpMCAASpWy2Ekvopa6G1npWflw4z6AsoDp3wI18/QFUuOaXKaGuapTsP03x4zdSGkGThAfnBpp+HvGBRoqy8Q3XVYHMASBrfzhuF9KSXUOxMUSUFjA4ZHqmLLmhzdfo9ekP6r5S6cKVW2oGEkdV3KI6oMhx3i6RfVeMTjAekeu1gu0rjVjfePY+AqEkXQ+WXVWuvtf3n16QIo+7fAPVitSZ2QMKR2tiy/W4GFlNBW/y+9unDQ5Z+Xrvlfp43cUT29MkE8jPXZ9T9f1zMNOiw7JfF2csbV/xaR1q38Vnxi1n/Hehd+saDcIOepxDZevcQ6gM5e02zjPSO0+Dw8aTdSeHFy65hN/of3Bgoig==
X-Forefront-Antispam-Report:
	CIP:74.117.212.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:email.selinc.com;PTR:wpul-exchange1.selinc.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(30052699003)(82310400026)(1800799024)(13003099007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x+KTcipHvfGnGHHdF8sNd5OBdw1RPxBSyhBMLJldrtAJPcuIG11ZuB39cTxlGjbLQEdnh8yLeHUtbpQuee88FYT15YRSIH1fZuA4HmHigNJQDFvxDKXBoCuIohZcuWjmyxVjqHxOVVNofNAArpaMkQnUGcTs7n9RsG8PqMOJWXwTGKgd0aXfeldypfpAuOwJZSSF3kFx4rMcGRtDeuoRI4vwLBmmh6i0f3y9rTfOX++PVqAHICNqZTk687aIFd9nmz17WwpWBbKvuGvney/nkrlJ3NS5CP8W50Q532YgaaEsNgJq0pfFt9vJouX6xpfl1nD0T53senw83YVOKmRm2fMbmFgl/XpWEmJTre64FbRI7io3LOCbWfSu41kZcr1CLxF5/NmBkD+GSIEWcokxO/ZNNsKXiCwiVe+WdTFa2Mp8HVOygYNS726NOOdIZazz
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:36:42.0744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 503009a8-24a1-49e2-2712-08deedca3e8b
X-MS-Exchange-CrossTenant-Id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=12381f30-10fe-4e2c-aa3a-5e03ebeb59ec;Ip=[74.117.212.83];Helo=[email.selinc.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF6D267B6B8

On Wed, Jul 29, 2026 at 04:12:42PM -0700, Nathan Chancellor wrote:
> Does
> 
>   https://git.kernel.org/kbuild/c/39d6e68f50f4a444a6ba23b9ea2eaee806601c6d
> 
> resolve this issue for you?

Yes, it does. I apologize; I didn't see that there was already a fix.

Thanks,
Logan Finley
