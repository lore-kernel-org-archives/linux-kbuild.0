Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ms.lwn.net ([45.79.88.28]:57442 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbfJGN3c (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 09:29:32 -0400
Date: Mon, 7 Oct 2019 07:29:30 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
Message-ID: <20191007072930.07b1e90a@lwn.net>
In-Reply-To: <20191007081241.GA8279@linux-8ccs>
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
        <20191007060614.GA142813@google.com>
        <20191007081241.GA8279@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Zerella <adam.zerella@gmail.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 7 Oct 2019 10:12:42 +0200
Jessica Yu <jeyu@kernel.org> wrote:

> This was my line of thought as well, since the audience of
> admin-guide/ is sysadmins and users. Namespaces are mostly relevant to
> module authors and kernel developers. Currently, I don't think there
> is an existing good place in Documentation/ for this topic :-/
> I suppose kernel-hacking/ might be the closest fit, as Adam suggested.

I didn't see this thread before responding in the first, naturally...  

I think the core-api manual is probably as good a place as any for this.
Changing the name to something like symbol-namespaces.rst is probably a
good idea, since most people think of other things when they see
"namespaces".  Or perhaps that mythical Somebody could expand it into a
proper description of symbol exports in general...:)

Thanks,

jon
