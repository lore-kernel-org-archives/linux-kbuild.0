Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56294 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbfJGNl2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 09:41:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id a6so12716901wma.5
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Oct 2019 06:41:27 -0700 (PDT)
Date: Mon, 7 Oct 2019 14:41:24 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
Message-ID: <20191007134124.GC23938@google.com>
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
 <20191007060614.GA142813@google.com>
 <20191007081241.GA8279@linux-8ccs>
 <20191007072930.07b1e90a@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191007072930.07b1e90a@lwn.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Zerella <adam.zerella@gmail.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 07, 2019 at 07:29:30AM -0600, Jonathan Corbet wrote:
>On Mon, 7 Oct 2019 10:12:42 +0200
>Jessica Yu <jeyu@kernel.org> wrote:
>
>> This was my line of thought as well, since the audience of
>> admin-guide/ is sysadmins and users. Namespaces are mostly relevant to
>> module authors and kernel developers. Currently, I don't think there
>> is an existing good place in Documentation/ for this topic :-/
>> I suppose kernel-hacking/ might be the closest fit, as Adam suggested.
>
>I didn't see this thread before responding in the first, naturally...
>
>I think the core-api manual is probably as good a place as any for this.
>Changing the name to something like symbol-namespaces.rst is probably a
>good idea, since most people think of other things when they see
>"namespaces".  Or perhaps that mythical Somebody could expand it into a
>proper description of symbol exports in general...:)

As I said in the other thread, I am happy for it to be moved to a better
location. core-api/ as well as kernel-hacking/ seem to be good
locations.

I could imagine expanding the documentation, but would not like to
commit to it right now. (Even though I feel very encouraged by your talk
in Paris, Jon. Thanks for that!)

Cheers,
Matthias

>
>Thanks,
>
>jon
