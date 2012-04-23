Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57974 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751257Ab2DWS62 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Apr 2012 14:58:28 -0400
Message-ID: <4F95A67A.9060002@suse.cz>
Date: Mon, 23 Apr 2012 20:59:06 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] user-specified temporary directory for deb-pkg
References: <4F8C12FC.4010102@kingswood-consulting.co.uk>
In-Reply-To: <4F8C12FC.4010102@kingswood-consulting.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Kingswood <frank@kingswood-consulting.co.uk>
Cc: linux-kbuild@vger.kernel.org

Dne 16.4.2012 14:39, Frank Kingswood napsal(a):
> Hi,
> 
> The Debian package build can be very slow when running against a slow
> NFS server. This patch allows the user to set the BUILDTMP environment
> variable to move these temporaries somewhere local.

The user can simply use make O=/some/directory .....

Michal
