Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37947 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbfEJVDQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 17:03:16 -0400
Received: by mail-ot1-f67.google.com with SMTP id s19so6805309otq.5
        for <linux-kbuild@vger.kernel.org>; Fri, 10 May 2019 14:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <201905100945.V7PLp0za%lkp@intel.com>
In-Reply-To: <201905100945.V7PLp0za%lkp@intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 10 May 2019 14:03:04 -0700
Message-ID: <CAFd5g46nZ0=Djo6d6iqdSQLaLP0Qq5bC+uzyjpqp5fXnty7YOg@mail.gmail.com>
Subject: Re: [kbuild:kunit 14/17] htmldocs: include/kunit/kunit-stream.h:58:
 warning: Function parameter or member '2' not described in '__printf'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Felix Guo <felixguoxiuping@gmail.com>

On Thu, May 9, 2019 at 6:23 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kunit
> head:   c505c0b2e6237c729634327c178f5b0094f1c958
> commit: c69e87665049970d1c2d6fe2fa1ae7a7c8655420 [14/17] Documentation: kunit: add documentation for KUnit
> reproduce: make htmldocs
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
< snip >
>    drivers/gpu/drm/i915/i915_vma.h:50: warning: cannot understand function prototype: 'struct i915_vma '
>    drivers/gpu/drm/i915/i915_vma.h:1: warning: no structured comments found
>    drivers/gpu/drm/i915/intel_guc_fwif.h:536: warning: cannot understand function prototype: 'struct guc_log_buffer_state '
>    drivers/gpu/drm/i915/i915_trace.h:1: warning: no structured comments found
>    drivers/gpu/drm/i915/i915_reg.h:156: warning: bad line:
>    include/linux/interconnect.h:1: warning: no structured comments found
> >> include/kunit/kunit-stream.h:58: warning: Function parameter or member '2' not described in '__printf'

This looks like a bug in the kernel-doc parser: __printf in this context is:

> 8dcda743 Brendan Higgins 2019-05-01  56  void __printf(2, 3) kunit_stream_add(struct kunit_stream *this,
> 8dcda743 Brendan Higgins 2019-05-01  57                                      const char *fmt, ...);

which is an attribute to tell the compiler that this is a printf style
function with a printf style format string; it doesn't make sense to
describe it's parameters.

>    include/kunit/kunit-stream.h:58: warning: Function parameter or member '3' not described in '__printf'
>    include/kunit/kunit-stream.h:58: warning: Excess function parameter 'this' description in '__printf'
>    include/kunit/kunit-stream.h:58: warning: Excess function parameter 'fmt' description in '__printf'
>    include/linux/skbuff.h:897: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
< snip >
>    fs/debugfs/file.c:439: WARNING: Inline literal start-string without end-string.
>
> vim +58 include/kunit/kunit-stream.h
>
> 8dcda743 Brendan Higgins 2019-05-01  48
> 8dcda743 Brendan Higgins 2019-05-01  49  /**
> 8dcda743 Brendan Higgins 2019-05-01  50   * kunit_stream_add(): adds the formatted input to the internal buffer.
> 8dcda743 Brendan Higgins 2019-05-01  51   * @this: the stream being operated on.
> 8dcda743 Brendan Higgins 2019-05-01  52   * @fmt: printf style format string to append to stream.
> 8dcda743 Brendan Higgins 2019-05-01  53   *
> 8dcda743 Brendan Higgins 2019-05-01  54   * Appends the formatted string, @fmt, to the internal buffer.
> 8dcda743 Brendan Higgins 2019-05-01  55   */
> 8dcda743 Brendan Higgins 2019-05-01  56  void __printf(2, 3) kunit_stream_add(struct kunit_stream *this,
> 8dcda743 Brendan Higgins 2019-05-01  57                                      const char *fmt, ...);
> 8dcda743 Brendan Higgins 2019-05-01 @58
>
> :::::: The code at line 58 was first introduced by commit
> :::::: 8dcda743c31c1ffc0ac13f3d23f3dd1b85b545f8 kunit: test: add kunit_stream a std::stream like logger

Thanks!
