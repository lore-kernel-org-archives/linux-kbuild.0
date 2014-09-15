Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60342 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753252AbaIOJNF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Sep 2014 05:13:05 -0400
Message-ID: <5416AD96.7070306@suse.cz>
Date: Mon, 15 Sep 2014 11:12:54 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Implement /proc/built-in file similar to /proc/modules
References: <20140914100545.3745.23394.stgit@localhost> <20140914153832.GC4064@kroah.com>
In-Reply-To: <20140914153832.GC4064@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kirill Tkhai <tkhai@yandex.ru>
Cc: Greg KH <gregkh@linuxfoundation.org>, arnd@arndb.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, oleg@redhat.com, grant.likely@secretlab.ca, ebiederm@xmission.com, akpm@linux-foundation.org, ktkhai@parallels.com, sam@ravnborg.org

On 2014-09-14 17:38, Greg KH wrote:
> On Sun, Sep 14, 2014 at 02:18:13PM +0400, Kirill Tkhai wrote:
>> This series implements a possibility to show the list of built-in drivers
>> to userspace. The names of drivers will be the same as when they are modules.
> 
> Have you looked at /sys/modules/ ?  Doesn't that show what you want
> here?

Plus, we have /lib/modules/.../modules.builtin, which is already
understood by kmod. And if you badly need to display the list in /proc,
then please just reuse the modules.builtin file.

Michal

