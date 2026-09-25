Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021096.outbound.protection.outlook.com [52.101.100.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853273F0A8C;
	Fri, 25 Sep 2026 18:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359973; cv=fail; b=j68bJArfwLmTDInwJJ3zA4IwT7QbpUzKuNRiIMnFAJr9k/dsnhacOYZH4xO/fcZ0UEFrRbmqb0h9drvj9u+7oQY91wQMF5XxArn1jmU/f4+YpBZho8LzykXBm+j+NNF7yzMNX0f8A4lB3vhYQTnWQvCw2oA3g2Av9pPrLxCrGDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359973; c=relaxed/simple;
	bh=9kibU7SsyMrHYtatP6YQfoPfhHSIT9aCFMMhrlP+PYw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NzgOBnRy018XsXkddqUVg6LikLhmEwyk2MnvOkqQXBz9EZSwncLNbqk2weXO1zHejSfnINGOq8oj5kgmai2/sQFs33te8ZaPQrKc0p2cW//q2OhZFh0YIL4bpOKNgqJBy7/SjZSCO9lBEElcMyxvD9uV8fXqGd/LSw5HJRNg5FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhcNdb23LUr+EKHvEQ3dbjFcDL7mdaT5MoUS8ERUHPDgdn2l/GjfldMXnYikFJ/3A6OqiFPRrqP9rlQAbg57WTn9CiIAxLtNPFOBrN1cBEv/15HTu02+Sc+u84s9EnECdnVm3ADfiOoT1MhUcFHya97sXGPU216kImXy7m37uByQLHzmVc18v1UkAdJGc9lQrmkMrEmxGa+m5GfSdnDb99neOFBrhlsZXFPVMJ79DIbgHHndskIS9Xv2eyEQ+1162oAXaRHDXg2iB5KxTqgW3tdfbbRtwXBQoxpGvYtvq7RaBw1qgPQRlSngbJDeBgDYeuNKjF2BPfcbLup1rLLcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=3vaOheJynMSVWaOjeqKv23MclI/UgUg9scJT1bsECnk=;
 b=mS3FFLmdpA6ULOYK34atfmkS/Y/4/YZAHX9oEyOPxNN6AezlN5boqxgaL7+IFr6SbZBYAWpjmOr8ZtVMOH7lXlRZkqlAL4qeWe06LLGTIGpvVpSaI7kI/t0p/UxFJywVTXKDq0EI/utdzXqj4USXHI/3AdBglp/ijG345xMcxMH152hOv8gSbCeMO/Kp7yXlHQhivMBcTNat4Zjg88eMGWJSmY0R5irWbR4NzeOZO74HbJQabvCG/yn5Y/iTLthq+DBkPzEtnXuAiYR6meKrTNupXJptrW1g5Vb45duoOJt/lg3bZqJtYQl9AFzQlQqTmmbKC5EIdy9G1ixepwKeKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB6893.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:30a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Fri, 25 Sep
 2026 18:12:47 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 18:12:47 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	atomlin@atomlin.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] localmodconfig: Explicitly report boolean configs during integrity check
Date: Fri, 25 Sep 2026 14:12:30 -0400
Message-ID: <20260925181230.130525-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0059.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::12) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 12737707-aea1-4f47-0b39-08df1b309a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	4vy1lNZKFEunfYnD5Md5IzdFZQyITTmGo/GqeWH8WvOTo7/J0gMAzd3fwZbLkEoh4AHdm/JdQUvtEKKXjZIwD6jGoklXBKM2fxsB5O6y4FgkBiHzMpTfJCwBRgq49JcMtB6Gwh1qmSmrBcOf/YrxKWB49EDLeF8anvQ/86Cn0GHUD+v9BFA1DTj7ZMZCugCNfFAKyo0xZAOeQdrTqWTiudHcB43UuFcMF9DKAqYiEg4Wh/kA334tA+K4s/k9VmyXqCTZ0CoZqj9Q1U/uLpV6W9Auy20LNS3a4O4Pay0UNquo8a0jbt3iVFacCSxre0CGaE2ohEuNZ+AgfArTsCBAsp0thQNXLj9jjeuvFxZUe2DL4uKATAfjkftOFKUaPmKW+gCazaE/WYIJm6xqiS6gxjvIbF2bk3uIiAYsURyWTS+O1/YwjeOt15I42Rd+Mrj+ItuU8eCE6vPYmR35a7kamPJVuq8T70bBxg5XUj0tzr0T7i20XMQwPSDPJzYsY2J5yw7HmaAHuQvQ9/8/5mp5t2rVTs4Wx3zy29TJECMxw/6Wt/dV4Ie7MJMENsTZD7a81kvYTXhJj6e62hDw7IRbPhEFhcgQ4Va6CAhpcONx1ON7e2zLc9HPAjhbbypDD7r/kKt3svf7TPd0bZiFJo3c2raFo+QIz/T0sCm8BBsVIdE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fVdWwxhVkbSa6BsCHbktrCFkKYOsfmra/YdCDe/NL7QgbGLJRuronoYFjpvo?=
 =?us-ascii?Q?yjXW3h0K7JY5zwt+2CmDmvNCk5wDLBRThSV4ktdq0upObQt7NRZlCVjo6qaJ?=
 =?us-ascii?Q?7GnupDWMj7uOvHsBRNI+7jTF8rjRSeIKZlGGT0uYWIC+28i4jT66ZBdOMbIP?=
 =?us-ascii?Q?5/hVwsN4Cf078I9LpnfhMY1d9TDJspV8S9F1tDX+8Yi2pXwKq5xDhGxSSQ1e?=
 =?us-ascii?Q?uw45ZXAPcQ3g1EUGOGNdiXjAT3CoiyvItOV10rvRAa6DHskjhB73KLhCpQLf?=
 =?us-ascii?Q?9K9kaRxhcX3AOCvBz4T0y2sCMZ7Ix1th0b0+1cPqM1muiPi6lfyqc9FJJUPh?=
 =?us-ascii?Q?/mFGxg5EjLz8xyijSa/Gi+4eP/TzlThZh62FvafY87oQ95ElunIQ1V3tJVwr?=
 =?us-ascii?Q?HGSUsR9m0ds79TeFX46yqw1BzMFy3MJVLSpL5UhF/wxj3n/M6aep21TmGD9X?=
 =?us-ascii?Q?Oz2ivMujh7Q/1+bnElw7I9Pki/M9Nj9GNJ/TdQQc+rpXIv3gSset1JRZktL1?=
 =?us-ascii?Q?b68q3btzTHMAi1Vgl4Hjl3DCtb+R1jpifegpmHZCKMJ/geFR3DvcWTV0W8oh?=
 =?us-ascii?Q?ZkkluC8PNNNDPJK3GHo2LsND23nplpQld+hP6ouRFDs5ftP6uPEhHOg4JLK7?=
 =?us-ascii?Q?hRbuuFCn5WV8/2FfcaBUa/sAwKt1RVtBkrQiOG/4CD7Rh6SZ6NOJGH2Y0i29?=
 =?us-ascii?Q?kI+ueh32OB7Bys8t7aSyltL+KL0YbJmpdz0xbagUwNF9tZOW0AODy6v4HHVT?=
 =?us-ascii?Q?v9NPw57tIGJ5Xbwm5ZgjkwF95b+3pHcMGZEP32VNXin0G4iXkjgYwDMmerjs?=
 =?us-ascii?Q?zFoz+i3UJT0Iz2HGA6tyesYM4LcuWYVF6eLZkLBp/LRKqA+IxrY/cX3SuGTF?=
 =?us-ascii?Q?wztYisxe9sPTdm5oTfeuzHTPEUPAR04yu1GXdiBqAjXEgx0sBNMSm1Yk78zO?=
 =?us-ascii?Q?dD2emTkIjkUw5oTKY0DBkj0VSIWewqsDiWgpMpOwxh3KVXnjudTzhhLwy5lu?=
 =?us-ascii?Q?IxEO2ZuFZfLCq6dr4uRioTMNDrVgz5NgLXq0BcZQHKsbmCRoJZm7fX+YQN4l?=
 =?us-ascii?Q?/dOb3sl76Y9yybUQFr5TIPazbdmcdTrqTOw1jcaZogmFZMX4lV/jxCxuhgLn?=
 =?us-ascii?Q?IkTgkwF0KdwSR/bQdAU3E8uh8lLkK0boNc/tRSUVJscztaWHinWbEpLsGYt9?=
 =?us-ascii?Q?1iE4/uA0APxOx7zGNT8MJSDGCa8DnwvaebrIjF8WhKOtNBvWE0zQuBRKgDEV?=
 =?us-ascii?Q?T/n6B/4WXyjYF/LcikdF49TqIj4UIWYhyokyvIqF6ax9Rtb/sc1ypLnv4wj3?=
 =?us-ascii?Q?oYVqvhoQEnfypJ0+8TI9MUD0YUkx26O9yxtnwophC+MltHHF8XWDo98dqkdO?=
 =?us-ascii?Q?l2jk7/qfC74hqWPrGEjI85pHhPdnItFK0c1RXDZOSw06O9Nm5J5449Z3bYr/?=
 =?us-ascii?Q?9IDjb4ZvXcdS1Ek1MnA50HRoK05NKZkD7eY/nnjhGN2Wn5cGuxyfFtnbVRVR?=
 =?us-ascii?Q?ZY7kClDYltx+0ynPlEMf+TrRqMKQdXOEAgoAzSW32lVCXc9EpgdePueb1PpH?=
 =?us-ascii?Q?ACC4St2E8KLztZrtVdxwqXQPN8b+Em367Tyv+orsIo/MMFcu6D+jmVCq0P/o?=
 =?us-ascii?Q?UeD0sR+Q7TfnECx1D/oVkNQWdIC2ccmiVqsG4NXAFo6w1u9aDvlvPVWMWFYq?=
 =?us-ascii?Q?c0vwOtaEwg1o6e6zb8QwiS/qnHYXS9y1pLJDb8YPxM4p9u6QrxckiI99zXiv?=
 =?us-ascii?Q?ZdoYzzdc3A=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12737707-aea1-4f47-0b39-08df1b309a13
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 18:12:47.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otAbLAtTSEXW6SNxnlWRrhlqzYBvAW0mCCb46njgHo7LgCGC+DVRzW/IhozKcv50C5SSlc4lATSfO4zmF+JKWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB6893

When running make localmodconfig, streamline_config.pl reads loaded
modules and maps each module object to its corresponding Kconfig
symbol(s) using repository Makefiles.

In several instances, a loaded module corresponds to an object
controlled by a boolean symbol (e.g. config FOO declared as bool), or is
a composite module that depends on a boolean configuration. Because
boolean options only accept "=y" or disabled, they cannot be configured
as loadable modules ("=m").

Previously, if such a symbol was not already built-in ("=y") in the
baseline configuration, the final integrity check emitted an ambiguous
diagnostic. For example

    foo did not have configs CONFIG_FOO

Further investigation is required by developers to determine whether the
module was out-of-tree, its dependencies were unmet, or it failed due to
a type constraint. Address this by:
    1.  Tracking symbol types in a %types hash during Kconfig parsing.

    2.  Enhancing the final integrity check when running localmodconfig
        (!$localyesconfig) to explicitly annotate boolean symbols.

For example:

    module cec did not have configs CONFIG_CEC_CORE (tristate) CONFIG_RAS_CEC (boolean, not supported with =m)

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 scripts/kconfig/streamline_config.pl | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 8677d1ca06a7..6a52a98eb40e 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -145,6 +145,7 @@ my %prompts;
 my %objects;
 my %config2kfile;
 my %defaults;
+my %types;
 my $var;
 my $iflevel = 0;
 my @ifdeps;
@@ -224,6 +225,7 @@ sub read_kconfig {
 	} elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
 	    my $dep = $3;
             $defaults{$config} = 1;
+	    $types{$config} = $2 if (defined($2));
 	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
 		$dep =~ s/.*\sif\s+//;
 		$depends{$config} .= " " . $dep;
@@ -240,7 +242,13 @@ sub read_kconfig {
 	    }
 
 	# configs without prompts must be selected
-	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
+	} elsif ($state ne "NONE" && /^\s*(bool|boolean)(\s+\S.*)?$/) {
+	    $types{$config} = "bool";
+	    $prompts{$config} = 1 if (defined($2));
+	} elsif ($state ne "NONE" && /^\s*tristate(\s+\S.*)?$/) {
+	    $types{$config} = "tristate";
+	    $prompts{$config} = 1 if (defined($1));
+	} elsif ($state ne "NONE" && /^\s*prompt\b/) {
 	    # note if the config has a prompt
 	    $prompts{$config} = 1;
 
@@ -707,7 +715,15 @@ foreach my $module (keys(%modules)) {
 	}
 	print STDERR "module $module did not have configs";
 	foreach my $conf (@arr) {
-	    print STDERR " " , $conf;
+	    my $c = $conf;
+	    $c =~ s/^CONFIG_//;
+	    if (!$localyesconfig && defined($types{$c}) && $types{$c} eq "bool") {
+		print STDERR " $conf (boolean, not supported with =m)";
+	    } elsif (defined($types{$c})) {
+		print STDERR " $conf ($types{$c})";
+	    } else {
+		print STDERR " " , $conf;
+	    }
 	}
 	print STDERR "\n";
     }
-- 
2.55.0

