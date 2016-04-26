Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0220.hostedemail.com ([216.40.44.220]:53740 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751999AbcDZTsp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 15:48:45 -0400
Date: Tue, 26 Apr 2016 15:48:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] localmodconfig: Reset certificate paths
Message-ID: <20160426154841.796245bd@gandalf.local.home>
In-Reply-To: <1461696721-3001-1-git-send-email-bpoirier@suse.com>
References: <20160426185122.GA2979@f1.synalogic.ca>
	<1461696721-3001-1-git-send-email-bpoirier@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 26 Apr 2016 11:52:01 -0700
Benjamin Poirier <bpoirier@suse.com> wrote:

> When using `make localmodconfig` and friends, if the input config comes
> from a kernel that was built in a different environment (for example, the
> canonical case of using localmodconfig to trim a distribution kernel
> config) the key files for module signature checking will not be available
> and should be regenerated or omitted. Otherwise, the user will be faced
> with annoying errors when trying to build with the generated .config:
> 
> make[1]: *** No rule to make target 'keyring.crt', needed by 'certs/x509_certificate_list'.  Stop.
> Makefile:1576: recipe for target 'certs/' failed
> 
> Signed-off-by: Benjamin Poirier <bpoirier@suse.com>

Applied, thanks!

-- Steve
