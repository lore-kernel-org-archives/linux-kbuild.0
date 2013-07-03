Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49740 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756215Ab3GCUkM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Jul 2013 16:40:12 -0400
Message-ID: <51D48C22.4070906@suse.cz>
Date: Wed, 03 Jul 2013 22:40:02 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] scripts: Use RCS_FIND_IGNORE in more places
References: <51CB7713.7020901@gmail.com>
In-Reply-To: <51CB7713.7020901@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Dne 27.6.2013 01:19, Gabriel de Perthuis napsal(a):
> -RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS \
> -		   -o -name .pc -o -name .hg -o -name .git \) -prune -o
> +export RCS_FIND_IGNORE := ( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS \
> +		   -o -name .pc -o -name .hg -o -name .git ) -prune -o

This change breaks make mrproper.

Michal

