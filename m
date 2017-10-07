Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f49.google.com ([74.125.83.49]:47017 "EHLO
        mail-pg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751823AbdJGU0t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Oct 2017 16:26:49 -0400
Date: Sat, 7 Oct 2017 13:26:46 -0700
From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH v2] kbuild: clang: remove crufty HOSTCFLAGS
Message-ID: <20171007202646.73s4oaimjupkmnrc@lostoracle.net>
References: <CAK7LNARTo+esxqmoLrXufRoP7qbJprwVOYiRB-a2jRd=AZ0sXg@mail.gmail.com>
 <20171007202323.1993-1-nick.desaulniers@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171007202323.1993-1-nick.desaulniers@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: behanw@converseincode.com, dl9pf@gmx.de, charlebm@gmail.com, mka@chromium.org, ghackmann@google.com, md@google.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Sorry, I forgot to note the changes in v2:

* Dont add back -fno-delete-null-pointer-checks wrapped in
  hostcc-option, just remove all flags.
* Update wording of commit message.
