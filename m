Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:63807 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934855AbcKDNto (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 09:49:44 -0400
Subject: Re: scripts/basic/bin2c: Complete error handling in main()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
 <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
 <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
 <CAK7LNASJiV0T-ruC6mLMzaHKzUDo2rFp0h1H1dQXjGk+wUzc5Q@mail.gmail.com>
 <f6b51b63-909a-24ab-f891-7416860bf552@users.sourceforge.net>
 <b9ecd83c-81ad-d1ce-c619-1940c06d42eb@suse.com>
 <359604cc-ec1a-84eb-4cf1-88e72641f724@users.sourceforge.net>
 <c2024819-f054-9b70-2b2c-582d4a9db061@suse.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <917e7b99-bb75-80b2-a356-918d6128705a@users.sourceforge.net>
Date: Fri, 4 Nov 2016 13:48:51 +0100
MIME-Version: 1.0
In-Reply-To: <c2024819-f054-9b70-2b2c-582d4a9db061@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> You could define an xprintf() macro that checks if the return value
>>> is < 0 and simply calls perror() and exit(1) in such case.
>> Does such a macro belong to any general header file from the Linux
>> software library?
> No.

Would you like to add it?

How do you think about to reuse it in more source files?

Regards,
Markus
