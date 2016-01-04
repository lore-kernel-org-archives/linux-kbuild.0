Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60354 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752313AbcADWhZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2016 17:37:25 -0500
Subject: Re: Thoughts about introducing OPTIMIZATION_CFLAG
References: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
 <20160104113318.700a9ed0@lxorguk.ukuu.org.uk>
 <CA+icZUUAoG0VeY06r_=c7aNGbuSkHp5VRHNSB=bQGTiTHShGtQ@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <568AF421.7050305@suse.cz>
Date: Mon, 4 Jan 2016 23:37:21 +0100
MIME-Version: 1.0
In-Reply-To: <CA+icZUUAoG0VeY06r_=c7aNGbuSkHp5VRHNSB=bQGTiTHShGtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

Dne 4.1.2016 v 12:47 Sedat Dilek napsal(a):
> But I think you did not get my problem - to have two different
> optimization-levels for a compiler in *one* make-line makes no sense
> to me.

That we sometimes have -O2 ... -Os on the command line is not a problem,
since any same unix tool parses its options so that the last one of
mutually exclusive options wins. As to -Os vs. -Oz, to my knowledge
clang accepts both and -Oz means to reduce size by any means. If -Oz is
more appropriate for the CONFIG_CC_OPTIMIZE_FOR_SIZE case and/or for the
individual object files, feel free to change it, but please do not
introduce another variable holding compiler options.

Michal
