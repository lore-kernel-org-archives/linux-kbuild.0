Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:55175 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754084AbZKEMRe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Nov 2009 07:17:34 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 0/10] module: Speed up symbol resolution during module loading (using binary search)
Date: Thu, 5 Nov 2009 22:47:37 +1030
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <1257242782-10496-1-git-send-email-alan-jenkins@tuffmail.co.uk> <20091103155824.GA23857@kroah.com>
In-Reply-To: <20091103155824.GA23857@kroah.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200911052247.37545.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Wed, 4 Nov 2009 02:28:24 am Greg KH wrote:
> Can you send this to Ingo for inclusion in the -tip tree?  Or should it
> go through someone else's tree instead?

Gee, did the "module" prefix not supply sufficient hint? :)

I'd like an ack for the build and arm bits, but I'm not going to hold it
up if not.

Cheers,
Rusty.
