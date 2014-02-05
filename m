Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52965 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752452AbaBEPFj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Feb 2014 10:05:39 -0500
Message-ID: <52F2533F.2020302@suse.cz>
Date: Wed, 05 Feb 2014 16:05:35 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile, CONFIG_MODVERSIONS, ignore *.mod.c files
References: <1391612511-9276-1-git-send-email-prarit@redhat.com>
In-Reply-To: <1391612511-9276-1-git-send-email-prarit@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Kirill Tkhai <tkhai@yandex.ru>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

On 2014-02-05 16:01, Prarit Bhargava wrote:
> Add *.mod.c to the RCS_FIND_IGNORE in the top-level Makefile and to the ignore
> list in scripts/tags.sh.


This breaks make clean, which is supposed to remove the *.mod.c files.

Michal

