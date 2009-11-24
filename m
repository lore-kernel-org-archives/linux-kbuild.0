Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54238 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933802AbZKXTHL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 14:07:11 -0500
Message-ID: <4B0C2EE8.8070109@suse.cz>
Date: Tue, 24 Nov 2009 20:07:20 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/3] scripts/package: deb-pkg: use fakeroot if available
References: <20091014064622.GA8711@progeny.tock> <20091014071627.GA6256@merkur.ravnborg.org> <200910141159.03799.elendil@planet.nl> <20091014110331.GZ28231@baikonur.stro.at> <20091015133139.GA6718@progeny.tock> <20091015133532.GB6718@progeny.tock> <4B0BC306.9010009@suse.cz> <20091124150904.GA14731@progeny.tock> <20091124152156.GD14731@progeny.tock>
In-Reply-To: <20091124152156.GD14731@progeny.tock>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

Jonathan Nieder wrote:
> Running "make deb-pkg" requires setting KBUILD_PKG_ROOTCMD or
> becoming root oneself or it errors out.  Unless already running
> as root or KBUILD_PKG_ROOTCMD is already set, use fakeroot as a
> good default.
> 
> With this patch applied, you can run "make oldconfig rpm-pkg" as
                                                       deb-pkg :)

Otherwise Acked-by: Michal Marek <mmarek@suse.cz> for this and the
previous patch.

Michal
