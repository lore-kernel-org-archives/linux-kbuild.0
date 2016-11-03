Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44242 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751691AbcKCPm1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Nov 2016 11:42:27 -0400
Subject: Re: scripts/basic/bin2c: Complete error handling in main()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
 <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
 <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
 <CAK7LNASJiV0T-ruC6mLMzaHKzUDo2rFp0h1H1dQXjGk+wUzc5Q@mail.gmail.com>
 <f6b51b63-909a-24ab-f891-7416860bf552@users.sourceforge.net>
From: Michal Marek <mmarek@suse.com>
Message-ID: <b9ecd83c-81ad-d1ce-c619-1940c06d42eb@suse.com>
Date: Thu, 3 Nov 2016 16:42:22 +0100
MIME-Version: 1.0
In-Reply-To: <f6b51b63-909a-24ab-f891-7416860bf552@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Dne 2.11.2016 v 19:46 SF Markus Elfring napsal(a):
>> I like the code as is.
> 
> Do you really prefer to ignore important return values in the discussed function?

You could define an xprintf() macro that checks if the return value is <
0 and simply calls perror() and exit(1) in such case.

Michal
