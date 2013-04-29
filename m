Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:32811 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933170Ab3D2VyR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 17:54:17 -0400
Received: by mail-ie0-f176.google.com with SMTP id x14so7921208ief.21
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Apr 2013 14:54:17 -0700 (PDT)
Date: Mon, 29 Apr 2013 16:54:14 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/1] kconfig: fix lists definition for C++
References: <cover.1367258255.git.yann.morin.1998@free.fr>
	<21ca352b71ca252e1933b1538fe89da8a04395c3.1367258255.git.yann.morin.1998@free.fr>
	<517EC9C7.9000903@infradead.org>
In-Reply-To: <517EC9C7.9000903@infradead.org> (from rdunlap@infradead.org on
	Mon Apr 29 14:28:07 2013)
Message-Id: <1367272454.18069.191@driftwood>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Benjamin Poirier <bpoirier@suse.de>

On 04/29/2013 02:28:07 PM, Randy Dunlap wrote:
> On 04/29/13 10:59, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > The C++ compiler is more strict in that it refuses to assign
> > a void* to a struct list_head*.

Given that the code _isn't_ C++ (because C is not a subset of C++ but a  
separate langauge in its own right where "throw" is a legitimate  
variable name and so on), how is this an issue?

Rob