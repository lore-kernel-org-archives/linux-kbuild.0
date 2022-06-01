Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B94C433F5
	for <linux-kbuild@archiver.kernel.org>; Wed,  1 Jun 2022 11:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351013AbiFALbY (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 1 Jun 2022 07:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243810AbiFALbX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jun 2022 07:31:23 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845BA7035E;
        Wed,  1 Jun 2022 04:31:22 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n185so794072wmn.4;
        Wed, 01 Jun 2022 04:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8m5w0VP4J7yp0Tfw5vI1hU7tdi7anvKhoAsyYAE5VPU=;
        b=N994epOtFhDoj3ZPMMDoAZHkX3EoRIKLXRDzZwp+t0E6osKalIPMlP+cvmXi5MYVBu
         x5hM8D7fXmDwHhz/sGqWSee+ELg1CNUs0Jgy0NUhcQM+q5tx3Ot4tV33TvcjGtj4+2am
         WpY26WmNPYd4TLHRo7eUnTNX/9s/oWlzojs8uMp0P4Y8pNABP9Bbv5ha13Pk23ABpzND
         d6ei+PSo//An+YtCLE76ypmA/9x+GSNUfNEriXQIOK5mrJ/k4ttjOLuYFEyp2t0gJSaC
         9YQmQA/CBMShbtWTUyW0nCXgzMJaZ1TdPL5a+h7m5qHPs2CDeSRu8euDyQNOksb1R/+m
         7Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8m5w0VP4J7yp0Tfw5vI1hU7tdi7anvKhoAsyYAE5VPU=;
        b=6IfS547KbmFw8Rt+sJlUt1U0hRPUanPw6vmjDzgcfCiH9DozHBaoJwjBT6VXsq/W4u
         WeBa4rVtb7PeZDL5SCXhVvW0nDAzZFw9ewgzhhefeOg31QdIj0ncFIRoq8CPG8wK3P6t
         P4OtUHpHt85K3AAhcavr6+ApbwRNFrHLl0z69elIttc6BR/JwgMcu/8midTKEt6grt6Q
         hqpRRsP7Pz4EnpFznub7G3O3TjScyj8ECkgylT+3MRATPvWSBhzTCi6DKnE78H3pYJ6A
         2jYdVwIq2Itoo9qMZXHhDoOqDIRG5rEAID2Z0jquf0TNbDibL9gI3QajOCHNAIdn43IJ
         sVXg==
X-Gm-Message-State: AOAM530rKP0YzEiHVij8H4AUGsg0bzjnPolIEYEG4+WMEc5apHyMOTqJ
        FV1Bi2xF7RFiI76By5llBpk=
X-Google-Smtp-Source: ABdhPJyBKTFfBtnQ+y6h1hy7sPwwdWf3Q3fF+kHhgmrXnf0hnFooHIh9bxlAkXs6nnPXrAJ38MBfqQ==
X-Received: by 2002:a05:600c:4fd2:b0:39c:1586:a2e0 with SMTP id o18-20020a05600c4fd200b0039c1586a2e0mr10873557wmq.62.1654083080751;
        Wed, 01 Jun 2022 04:31:20 -0700 (PDT)
Received: from debian (host-2-98-37-191.as13285.net. [2.98.37.191])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d4fc1000000b0020fc4cd81f6sm1303439wrw.60.2022.06.01.04.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 04:31:20 -0700 (PDT)
Date:   Wed, 1 Jun 2022 12:31:18 +0100
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Nathan Chancellor <nathan@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org
Subject: mainline build failure due to f292d875d0dc ("modpost: extract symbol
 versions from *.cmd files")
Message-ID: <YpdOBmEmkG0AaOX0@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi All,

The latest mainline kernel branch fails to build for csky allmodconfig
with the error:

._divsi3.o.cmd: No such file or directory
make[1]: *** [scripts/Makefile.modpost:59: vmlinux.symvers] Error 1
make: *** [Makefile:1160: vmlinux] Error 2

git bisect pointed to f292d875d0dc ("modpost: extract symbol versions from *.cmd files")

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
