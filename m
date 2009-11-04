Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:60743 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932958AbZKDWox (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 17:44:53 -0500
Date: Wed, 4 Nov 2009 23:39:15 +0100
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] deb-pkg: Make deb-pkg generate a seperate linux-libc-dev deb
Message-ID: <20091104223915.GI29378@baikonur.stro.at>
References: <1257373849-25557-1-git-send-email-max@stro.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1257373849-25557-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

> +make headers_install INSTALL_HDR_PATH="$headerdir/usr" 

one nitpick on that target is that it adds strange files too:
./usr/include/.install
./usr/include/..install.cmd

in allmost any dir.
