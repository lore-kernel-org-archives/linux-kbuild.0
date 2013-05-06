Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40657 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753016Ab3EFHve (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 May 2013 03:51:34 -0400
Subject: Wish: exact matches displayed first
From: Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 May 2013 09:50:29 +0200
Message-ID: <1367826629.4494.30.camel@chaos.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Roland Eggner <edvx1@systemanalysen.net>, Wang YanQing <udknight@gmail.com>

Hi all,

I wish a search in "make menuconfig" would return an exact match, if it
exists, first in the list. At the moment, looking for "PCI", for
example, returns several dozen entries (anything matching "PCI") and
CONFIG_PCI is far away from the top. Ideally I would expect this query
to return CONFIG_PCI first.

Thanks,
-- 
Jean Delvare
Suse L3

