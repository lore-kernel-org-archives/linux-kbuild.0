Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qv1-f65.google.com ([209.85.219.65]:39381 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgBEVgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 16:36:10 -0500
Received: by mail-qv1-f65.google.com with SMTP id y8so1858757qvk.6
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2020 13:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
 <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
 <20200205171353.GI142103@google.com> <20200205213354.GB1465126@kroah.com>
In-Reply-To: <20200205213354.GB1465126@kroah.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 5 Feb 2020 13:35:56 -0800
Message-ID: <CAEXW_YSU_Zm24R2TYFQd42CfXyotowv42BbvbvKfSFbZGUqOHQ@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Olof Johansson <olof@lixom.net>, Alexei Starovoitov <ast@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Howells <dhowells@redhat.com>, Patrick Bellasi <patrick.bellasi@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kbuild@vger.kernel.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 5, 2020 at 1:33 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
[snip]
> > > like the BTF approach is significantly better and said users are
> > > hopefully moving forward to it quickly, and if they can't move
> > > forward, then they're likely also not going to move forward to newer
> > > kernels either?
> >
> > I think BCC runs on a lot of upstream machines. I think the migration
> > strategy is a matter of opinion, one way is to take it out and cause some
> > pain in the hope that users/tools will migrate soon (while probably carrying
> > the reverted patches out of tree). Another is to migrate the tools first and
> > then take it out (which has its own disadvantages such as introducing even
> > more users of it while it is still upstream).
>
> Do we "know" what tools today require this, and what needs to be done to
> "fix" them?  If we don't know that, then there's no way to drop this,
> pretty much ever :(

Is there a real reason to drop it or a problem dropping this solves though?

thanks,

  - Joel
