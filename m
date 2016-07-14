Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55995 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751208AbcGNCKs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jul 2016 22:10:48 -0400
Date: Thu, 14 Jul 2016 04:10:45 +0200
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [patch] kconfig: Add some missing curly braces
Message-ID: <20160714021045.GG6239@wotan.suse.de>
References: <20160713223433.GA20475@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160713223433.GA20475@mwanda>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Michal Marek <mmarek@suse.com>

On Thu, Jul 14, 2016 at 01:34:33AM +0300, Dan Carpenter wrote:
> There are missing curly braces here so we print some stuff to stderr
> which we hadn't intended.
> 
> Fixes: 1c199f2878f6 ('kbuild: document recursive dependency limitation / resolution')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>

  Luis
