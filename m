Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39092 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752316AbdFNNCo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 09:02:44 -0400
Subject: Re: [PATCH] Unexport LANG env variable
References: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <51f658dc-215a-6c0c-0ab9-d1164812a56d@suse.com>
Date: Wed, 14 Jun 2017 15:02:36 +0200
MIME-Version: 1.0
In-Reply-To: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-snps-arc@lists.infradead.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>

Dne 14.6.2017 v 14:40 Alexey Brodkin napsal(a):
> In those cases when we parse output of standard utilities like readelf
> etc we rely on a particular sentences. For example for ARC we extract
> an entry-point from vmlinux like that:
> ---------------------->8--------------------
> readelf -h vmlinux | grep "Entry point address" | grep -o 0x.*
> ---------------------->8--------------------
> 
> And in case LANG is set to anything other than en_XX we're getting
> nothing and subsequent execution of mkimage utility fails.
> 
> Probably there're more cases like that but given people rarely
> use non-English locales on their dev machines problems like the one
> above are not very visible.

I'm all for this change but the *.po files in the gcc tree must have
been created for a reason:

  https://github.com/gcc-mirror/gcc/tree/master/gcc/po

:)

Michal
