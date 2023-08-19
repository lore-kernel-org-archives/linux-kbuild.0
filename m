Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED838EE49AB
	for <linux-kbuild@archiver.kernel.org>; Sun, 20 Aug 2023 00:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjHTASb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 19 Aug 2023 20:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjHTAR6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2023 20:17:58 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E63CC9B0B;
        Sat, 19 Aug 2023 14:08:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id D724463DB803;
        Sat, 19 Aug 2023 23:08:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kHl1OPWAh-P7; Sat, 19 Aug 2023 23:08:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 7AB6963DB801;
        Sat, 19 Aug 2023 23:08:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5W9G0FvcbqQr; Sat, 19 Aug 2023 23:08:11 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 3B78E63DB7E5;
        Sat, 19 Aug 2023 23:08:11 +0200 (CEST)
Date:   Sat, 19 Aug 2023 23:08:11 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     masahiroy <masahiroy@kernel.org>
Cc:     anton ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um <linux-um@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>, bp <bp@alien8.de>,
        dave hansen <dave.hansen@linux.intel.com>, hpa <hpa@zytor.com>,
        mingo <mingo@redhat.com>, tglx <tglx@linutronix.de>,
        x86 <x86@kernel.org>
Message-ID: <707999896.6490583.1692479291135.JavaMail.zimbra@nod.at>
In-Reply-To: <20230721171857.3612639-1-masahiroy@kernel.org>
References: <20230721171857.3612639-1-masahiroy@kernel.org>
Subject: Re: [PATCH v2 1/2] UML: hard-code the result of 'uname -s'
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: hard-code the result of 'uname -s'
Thread-Index: QAVkLQ/mIgPHvNavgfzggSVolfSknw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

----- Ursprüngliche Mail -----
> Von: "masahiroy" <masahiroy@kernel.org>
> We rely on 'uname -s' returning 'Linux' because there are os-Linux/
> directories, but no other os-*/.
> 
> Supporting a non-Linux host is unlikely to happen.
> 
> Let's hard-code 'Linux'.

While I agree that a non-Linux version is unlikely I'd like to
know why we can't keep the uname -s check?
I guess to avoid unnecessary command execution?

Thanks,
//richard
