Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60560 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753715AbaIOJRk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Sep 2014 05:17:40 -0400
Message-ID: <5416AEB2.8080003@suse.cz>
Date: Mon, 15 Sep 2014 11:17:38 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Implement /proc/built-in file similar to /proc/modules
References: <20140914100545.3745.23394.stgit@localhost> <20140914153832.GC4064@kroah.com> <5415D10E.90809@yandex.ru>
In-Reply-To: <5415D10E.90809@yandex.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: tkhai@yandex.ru
Cc: Greg KH <gregkh@linuxfoundation.org>, arnd@arndb.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, oleg@redhat.com, grant.likely@secretlab.ca, ebiederm@xmission.com, akpm@linux-foundation.org, ktkhai@parallels.com, sam@ravnborg.org

On 2014-09-14 19:31, Kirill Tkhai wrote:
> For example, when I compile "loop" module built-in and "loop" is in
> /etc/modules, init script warns about this module is not present and
> can't be autoloaded. The script does not store CONFIG_XXX <-> module_xxx
> conformity. And nobody stores it.

You must be using really old userspace. I have loop modular, but

# modprobe ipv6; echo $?
0
# modprobe --show-depends ipv6
builtin ipv6
# strace -eopen modprobe ipv6
...
open("/lib/modules/3.12.15-3-default/modules.builtin.bin",
O_RDONLY|O_CLOEXEC) = 3
+++ exited with 0 +++
# modprobe --version
kmod version 18

Michal
