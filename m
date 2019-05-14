Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37244 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfENXTJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 May 2019 19:19:09 -0400
Received: by mail-pl1-f194.google.com with SMTP id p15so345128pll.4
        for <linux-kbuild@vger.kernel.org>; Tue, 14 May 2019 16:19:09 -0700 (PDT)
Date: Tue, 14 May 2019 16:19:02 -0700
From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v3 15/18] Documentation: kunit: add documentation for
 KUnit
Message-ID: <20190514231902.GA12893@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-16-brendanhiggins@google.com>
 <20190514073422.4287267c@lwn.net>
 <20190514180810.GA109557@google.com>
 <20190514121623.0314bf07@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514121623.0314bf07@lwn.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Felix Guo <felixguoxiuping@gmail.com>

On Tue, May 14, 2019 at 12:16:23PM -0600, Jonathan Corbet wrote:
> On Tue, 14 May 2019 11:08:10 -0700
> Brendan Higgins <brendanhiggins@google.com> wrote:
> 
> > > Naturally, though, I have one request: I'd rather not see this at the top
> > > level, which is more than crowded enough as it is.  Can this material
> > > please go into the development tools book, alongside the kselftest
> > > documentation?

Hmmm...probably premature to bring this up, but Documentation/dev-tools/
is kind of thrown together.

It would be nice to provide a coherent overview, maybe provide some
basic grouping as well.

It would be nice if there was kind of a gentle introduction to the
tools, which ones you should be looking at, when, why, etc.

> > Oh yeah, that seems like the obvious home for this in hindsight. Sorry
> > about that. Will fix in next revision!
> 
> No need to apologize - I have to say the same thing to everybody :)
